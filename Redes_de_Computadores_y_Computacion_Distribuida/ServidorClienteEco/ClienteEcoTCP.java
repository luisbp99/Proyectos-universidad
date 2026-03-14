
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author Usuario
 */
public class ClienteEcoTCP {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        String frase;
        String servidor = "localhost";
        int puerto = 6666;
        
        if(args.length>0)
            servidor = args[0];
        if(args.length>1)
            puerto = Integer.valueOf(args[1]);
        
        System.out.println("Servidor "+servidor+" puerto "+puerto+"\n");
        
        //1 y 2.-Definir el socket y solicitud de conexion
        Socket socketCliente;
        socketCliente = new Socket(servidor, puerto);
        
        //3.-Definir flujo de entrada
        BufferedReader entrada = new BufferedReader(new InputStreamReader(socketCliente.getInputStream()));
        PrintWriter salida = new PrintWriter(socketCliente.getOutputStream(), true);
        BufferedReader teclado = new BufferedReader(new InputStreamReader(System.in));
        
        String linea;
        while (true){
            System.out.print("Escribe algo (salir para terminar la conexion): ");
            linea = teclado.readLine();
            
            if (linea.equalsIgnoreCase("salir")) break;
            
            salida.println(linea);
            frase = entrada.readLine();
            System.out.println("Servidor devuelve: "+frase);
        }
        
        //4-.Cerrar flujo y socket
        teclado.close();
        entrada.close();
        salida.close();
        socketCliente.close();
    }
    
}
