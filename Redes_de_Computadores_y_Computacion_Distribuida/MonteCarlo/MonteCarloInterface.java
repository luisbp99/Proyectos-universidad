// A simple RMI interface file - M. Liu
import java.rmi.*;

public interface MonteCarloInterface extends Remote {
    public int contarDentroDelCirculo(int n) throws RemoteException;
}
