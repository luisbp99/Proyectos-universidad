
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author Usuario
 */
public class UDPRecibeEco {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SocketException, IOException {
    int puertoLocal = 5001;

    if (args.length > 0)
        puertoLocal = Integer.parseInt(args[0]);

    DatagramSocket socketRecibe = new DatagramSocket(puertoLocal);
    byte[] buffer = new byte[1024];

    System.out.println("Servidor UDP escuchando en puerto " + puertoLocal);

    while (true) {
        // Recibir mensaje
        DatagramPacket paqueteRecepcion = new DatagramPacket(buffer, buffer.length);
        socketRecibe.receive(paqueteRecepcion);

        String mensaje = new String(paqueteRecepcion.getData(), 0, paqueteRecepcion.getLength());
        InetAddress ipOrigen = paqueteRecepcion.getAddress();
        int puertoOrigen = paqueteRecepcion.getPort();

        System.out.println("Recibido de " + ipOrigen + ":" + puertoOrigen + " -> " + mensaje);

        // Convertir a mayúsculas (comportamiento de eco)
        String respuesta = mensaje.toUpperCase();
        byte[] datosRespuesta = respuesta.getBytes();

        // Enviar eco de vuelta
        DatagramPacket paqueteEnvio = new DatagramPacket(
            datosRespuesta, datosRespuesta.length, ipOrigen, puertoOrigen);
        socketRecibe.send(paqueteEnvio);
    }
    }
}
