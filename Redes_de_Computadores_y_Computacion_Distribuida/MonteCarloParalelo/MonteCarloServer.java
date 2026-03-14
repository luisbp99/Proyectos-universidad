import java.rmi.Naming;

public class MonteCarloServer{
    public static void main(String[] args){
        try{
            MonteCarloInterface obj = new MonteCarloImpl();
            Naming.rebind("MonteCarlo",obj);
            System.out.println("Servidor MonteCarlo listo");
        } catch (Exception e){
            System.out.println("MonteCarloServer error: "+e.getMessage());
            e.printStackTrace();
        }
    }
}