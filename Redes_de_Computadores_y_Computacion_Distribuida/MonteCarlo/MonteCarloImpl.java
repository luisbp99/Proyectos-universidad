import java.rmi.*;
import java.rmi.server.*;
import java.util.Random;

public class MonteCarloImpl extends UnicastRemoteObject implements MonteCarloInterface {
    
    protected MonteCarloImpl() throws RemoteException {
        super();
    }

    public int contarDentroDelCirculo(int n) throws RemoteException {
        Random rand = new Random();
        int dentro = 0;

        for (int i = 0; i < n; i++) {
            double x = rand.nextDouble();
            double y = rand.nextDouble();
            if (x * x + y * y <= 1.0) {
                dentro++;
            }
        }

        return dentro;
    }
}
