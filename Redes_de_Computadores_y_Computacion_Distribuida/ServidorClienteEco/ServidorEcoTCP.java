/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
/**
 *
 * @author Usuario
 */
public class ServidorEcoTCP {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        String frase;
        int puerto = 6666;
        
        if(args.length > 0)
            puerto = Integer.valueOf(args[0]);
        
        System.out.println("Puerto de escucha"+puerto+"\n");
        
        //1.-Definicion del socket de servidor
        ServerSocket socketServidor;
        socketServidor = new ServerSocket(puerto);
        
        //Bucle para varios cliente de uno en uno
        while (true)
        {
            //2.-Aceptar la conexion y crear el socket de conexion
            
            Socket socketConexion;
            socketConexion = socketServidor.accept();
            
            System.out.println("Cliente conectado desde: "+socketConexion.getInetAddress());
            
            //Flujos de entrada salida
            BufferedReader entrada = new BufferedReader(new InputStreamReader(socketConexion.getInputStream()));
            PrintWriter salida = new PrintWriter(socketConexion.getOutputStream(), true);
            
            String linea;
            while((linea = entrada.readLine()) != null){
                System.out.println("Recibido "+linea);
                salida.println(linea.toUpperCase());
            }
            
            entrada.close();
            salida.close();
            socketConexion.close();
            System.out.println("Cliente desconectado.");
        }
    }
    
}
