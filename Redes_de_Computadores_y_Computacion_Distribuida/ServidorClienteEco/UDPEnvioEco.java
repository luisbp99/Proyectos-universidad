
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author Usuario
 */
public class UDPEnvioEco {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
    String destino = "localhost";
    int puertoLocal = 5002, puertoRemoto = 5001;

    if (args.length > 0)
        destino = args[0];
    if (args.length > 1)
        puertoRemoto = Integer.parseInt(args[1]);
    if (args.length > 2)
        puertoLocal = Integer.parseInt(args[2]);

    InetAddress ipDestino = InetAddress.getByName(destino);
    DatagramSocket socketEnvia = new DatagramSocket(puertoLocal);
    socketEnvia.setSoTimeout(2000); // Timeout para evitar bloqueos infinitos

    BufferedReader teclado = new BufferedReader(new InputStreamReader(System.in));
    byte[] bufferEnvio;
    byte[] bufferRecepcion = new byte[1024];

    System.out.println("Cliente UDP listo. Escribe 'salir' para terminar.");

    while (true) {
        System.out.print("Introduce mensaje: ");
        String mensaje = teclado.readLine();
        if (mensaje.equalsIgnoreCase("salir")) break;

        bufferEnvio = mensaje.getBytes();
        DatagramPacket paqueteEnvio = new DatagramPacket(bufferEnvio, bufferEnvio.length, ipDestino, puertoRemoto);
        socketEnvia.send(paqueteEnvio);

        DatagramPacket paqueteRespuesta = new DatagramPacket(bufferRecepcion, bufferRecepcion.length);
        socketEnvia.receive(paqueteRespuesta);

        String respuesta = new String(paqueteRespuesta.getData(), 0, paqueteRespuesta.getLength());
        System.out.println("Respuesta del servidor: " + respuesta);
    }

    socketEnvia.close();
    teclado.close();
}

}
