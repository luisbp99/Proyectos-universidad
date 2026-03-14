import java.io.*;
import java.rmi.*;
import java.util.Scanner;

public class MonteCarloClient {

    // Clase interna para ejecutar llamadas RMI en paralelo
    static class MonteCarloWorker extends Thread {
        private MonteCarloInterface servidor;
        private int puntos;
        private int resultado;

        public MonteCarloWorker(MonteCarloInterface servidor, int puntos) {
            this.servidor = servidor;
            this.puntos = puntos;
        }

        public void run() {
            try {
                resultado = servidor.contarDentroDelCirculo(puntos);
            } catch (Exception e) {
                System.out.println("Error en hilo: " + e.getMessage());
            }
        }

        public int getResultado() {
            return resultado;
        }
    }

    public static void main(String[] args) {
        try {
            // Obtener el stub del servidor
            MonteCarloInterface servidor = (MonteCarloInterface) Naming.lookup("MonteCarlo");

            Scanner sc = new Scanner(System.in);

            System.out.print("¿Cuántos puntos aleatorios deseas generar en total?: ");
            int totalPuntos = sc.nextInt();

            System.out.print("¿Con cuántos hilos (clientes paralelos) quieres trabajar?: ");
            int numHilos = sc.nextInt();

            int puntosPorHilo = totalPuntos / numHilos;
            MonteCarloWorker[] hilos = new MonteCarloWorker[numHilos];

            // Crear y lanzar hilos
            for (int i = 0; i < numHilos; i++) {
                hilos[i] = new MonteCarloWorker(servidor, puntosPorHilo);
                hilos[i].start();
            }

            // Esperar a que terminen
            int totalDentro = 0;
            for (int i = 0; i < numHilos; i++) {
                hilos[i].join();
                totalDentro += hilos[i].getResultado();
            }

            double pi = 4.0 * totalDentro / (double) (puntosPorHilo * numHilos);
            System.out.println("Estimación de PI usando " + totalPuntos + " puntos y " + numHilos + " hilos: " + pi);

        } catch (Exception e) {
            System.out.println("Error en MonteCarloClient: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
