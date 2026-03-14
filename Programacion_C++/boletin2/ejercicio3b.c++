#include <iostream>
#include <fstream>
using namespace std;

void ingresarMatriz(double** matriz, int filas, int columnas, ifstream &archivo) {
    for (int i = 0; i < filas; i++) {
        for (int j = 0; j < columnas; j++) {
            archivo >> matriz[i][j]; // Leer los elementos de la matriz desde el archivo
        }
    }
}

void imprimirMatriz(double** matriz, int filas, int columnas) {
    for (int i = 0; i < filas; i++) {
        for (int j = 0; j < columnas; j++) {
            cout << matriz[i][j] << " ";
        }
        cout << endl;
    }
}

double** crearMatriz(int filas, int columnas) {
    double** matriz = new double*[filas];
    for (int i = 0; i < filas; i++) {
        matriz[i] = new double[columnas];
    }
    return matriz;
}

void eliminarMatriz(double** matriz, int filas) {
    for (int i = 0; i < filas; i++) {
        delete[] matriz[i];
    }
    delete[] matriz;
}

double** add(double** A, double** B, int filasA, int columnasA, int filasB, int columnasB) {
    if (filasA != filasB || columnasA != columnasB) {
        cout << "Error: Las dimensiones de las matrices no coinciden para la suma." << endl;
        return nullptr;
    }
    
    double** C = crearMatriz(filasA, columnasA);
    for (int i = 0; i < filasA; i++) {
        for (int j = 0; j < columnasA; j++) {
            C[i][j] = A[i][j] + B[i][j];
        }
    }
    return C; // Se retorna la matriz resultante
}

double** mul(double** A, double** B, int filasA, int columnasA, int filasB, int columnasB) {
    if (columnasA != filasB) {
        cout << "Error: Las dimensiones de las matrices no son compatibles para la multiplicación." << endl;
        return nullptr;
    }

    double** C = crearMatriz(filasA, columnasB);
    for (int i = 0; i < filasA; i++) {
        for (int j = 0; j < columnasB; j++) {
            C[i][j] = 0;
            for (int k = 0; k < columnasA; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
    return C; // Se retorna la matriz resultante
}

int main() {
    short int op;
    bool repetir = true;
    
    // Abrir el archivo de entrada
    ifstream archivo("matrices.txt");
    
    if (!archivo.is_open()) {
        cout << "No se pudo abrir el archivo." << endl;
        return 1;
    }

    while (repetir) {
        cout << "------------------------" << endl;
        cout << "Operacion a realizar" << endl;
        cout << "1: Suma de matrices" << endl;
        cout << "2: Multiplicacion de matrices" << endl;
        cout << "3: Salir" << endl;
        cin >> op;
        
        if (op == 1 || op == 2) {
            int filasA, columnasA, filasB, columnasB;
            
            // Leer las dimensiones y la matriz A
            archivo >> filasA >> columnasA;
            double** A = crearMatriz(filasA, columnasA);
            ingresarMatriz(A, filasA, columnasA, archivo);
            
            // Leer las dimensiones y la matriz B
            archivo >> filasB >> columnasB;
            double** B = crearMatriz(filasB, columnasB);
            ingresarMatriz(B, filasB, columnasB, archivo);
            
            double** C = nullptr;
            
            if (op == 1) {
                C = add(A, B, filasA, columnasA, filasB, columnasB);
            } 
            else if (op == 2) {
                C = mul(A, B, filasA, columnasA, filasB, columnasB);
            }

            if (C != nullptr) { // Si C no es nulo, entonces imprimimos el resultado
                cout << "Resultado de la operacion:" << endl;
                imprimirMatriz(C, filasA, (op == 1) ? columnasA : columnasB);
                eliminarMatriz(C, filasA);
            }

            eliminarMatriz(A, filasA);
            eliminarMatriz(B, filasB);

            archivo.clear();          // Limpiar el estado del archivo
            archivo.seekg(0, ios::beg);// Volver al inicio del archivo
        } 
        else if (op == 3) {
            repetir = false;
        } 
        else {
            cout << "La operacion no esta definida" << endl;
        }
    }

    // Cerrar el archivo
    archivo.close();

    return 0;
}

