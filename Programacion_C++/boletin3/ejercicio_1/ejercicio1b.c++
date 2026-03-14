#include <iostream>
#include <fstream>

using namespace std;

// Funciones sobrecargadas para sumar los elementos de un vector
int sum(int n, int *v) {
    int total = 0;
    for (int i = 0; i < n; i++) {
        total += v[i];
    }
    return total;
}

float sum(int n, float *v) {
    float total = 0.0f;
    for (int i = 0; i < n; i++) {
        total += v[i];
    }
    return total;
}

double sum(int n, double *v) {
    double total = 0.0;
    for (int i = 0; i < n; i++) {
        total += v[i];
    }
    return total;
}

int main() {
    int n;
    char tipo;
    string nombreArchivo;

    cout << "Ingrese el tipo de dato (i=int, f=float, d=double): ";
    cin >> tipo;
    
    cout << "Ingrese el nombre del archivo: ";
    cin >> nombreArchivo;

    ifstream archivo(nombreArchivo);
    if (!archivo.is_open()) {
        cout << "No se pudo abrir el archivo." << endl;
      return 0;
    }

    archivo >> n; // Leer el número de elementos
    if (n <= 0) {
        cout << "El tamaño del vector no es válido." << endl;
        return 0;
    }

    if (tipo == 'i') {
        int *v = new int[n];
        for (int i = 0; i < n; i++) {
            archivo >> v[i];
        }
        cout << v[2]<<endl;
           
        cout << "Suma de elementos (int): " << sum(n, v) << endl;
        cout<< typeid(sum(n,v)).name()<< endl;
        delete[] v;

    } else if (tipo == 'f') {
        float *v = new float[n];
        for (int i = 0; i < n; i++) {
            archivo >> v[i];
        }
        cout << "Suma de elementos (float): " << sum(n, v) << endl;
        cout<< typeid(sum(n,v)).name()<< endl;
        delete[] v;

    } else if (tipo == 'd') {
        double *v = new double[n];
        for (int i = 0; i < n; i++) {
            archivo >> v[i];
        }
        cout << "Suma de elementos (double): " << sum(n, v) << endl;
        cout<< typeid(sum(n,v)).name()<< endl;
        delete[] v;

    } else {
        cout << "Tipo de dato no válido." << endl;
    }

    archivo.close();
}