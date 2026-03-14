import java.io.*;
import java.rmi.*;

public class MonteCarloClient{
    public static void main(String[] args){
        try{
            MonteCarloInterface obj = (MonteCarloInterface) Naming.lookup("MonteCarlo");
            
            int n = 10000000;
            int dentro = obj.contarDentroDelCirculo(n);
            
            double pi = 4.0*dentro/n;
            
            System.out.println("Estimacion de PI usando "+n+" puntos: "+pi);
        }catch (Exception e){
            System.out.println("MonteCarloClient error "+e.getMessage());
            e.printStackTrace();
        }
    }
}