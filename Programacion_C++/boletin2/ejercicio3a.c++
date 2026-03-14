#include <iostream>
#include <fstream>
using namespace std;

void ingresarMatriz(double* matriz, int filas, int columnas, ifstream &archivo) {
    for (int i = 0; i < filas; i++) {
        for (int j = 0; j < columnas; j++) {
            archivo >> matriz[i * columnas + j]; // Leer los elementos de la matriz desde el archivo
        }
    }
}

void imprimirMatriz(double* matriz, int filas, int columnas) {
    for (int i = 0; i < filas; i++) {
        for (int j = 0; j < columnas; j++) {
            cout << matriz[i * columnas + j] << " "; // Acceso a los elementos de la matriz
        }
        cout << endl;
    }
}

double* crearMatriz(int filas, int columnas) {
    return new double[filas * columnas]; // Crear la matriz usando un único puntero
}

void eliminarMatriz(double* matriz) {
    delete[] matriz; // Liberar la memoria
}

double* add(double* A, double* B, int filasA, int columnasA, int filasB, int columnasB) {
    if (filasA != filasB || columnasA != columnasB) {
        cout << "Error: Las dimensiones de las matrices no coinciden para la suma." << endl;
        return nullptr; // Sale de la función si las dimensiones no son compatibles
    }
    
    double* C = crearMatriz(filasA, columnasA);
    for (int i = 0; i < filasA; i++) {
        for (int j = 0; j < columnasA; j++) {
            C[i * columnasA + j] = A[i * columnasA + j] + B[i * columnasA + j];
        }
    }
    return C; // Devolver la matriz resultante
}

double* mul(double* A, double* B, int filasA, int columnasA, int filasB, int columnasB) {
    if (columnasA != filasB) {
        cout << "Error: Las dimensiones de las matrices no son compatibles para la multiplicación." << endl;
        return nullptr; // Sale de la función si las dimensiones no son compatibles
    }

    double* C = crearMatriz(filasA, columnasB);
    for (int i = 0; i < filasA; i++) {
        for (int j = 0; j < columnasB; j++) {
            C[i * columnasB + j] = 0;
            for (int k = 0; k < columnasA; k++) {
                C[i * columnasB + j] += A[i * columnasA + k] * B[k * columnasB + j];
            }
        }
    }
    return C; // Devolver la matriz resultante
}

int main() {
    short int op;
    bool repetir = true;
    
    // Abrir el archivo de entrada
    ifstream archivo("matrices.txt");
    
    if (!archivo.is_open()) {
        cout << "No se pudo abrir el archivo." << endl;
        return 1; // Salir si el archivo no se pudo abrir
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
            double* A = crearMatriz(filasA, columnasA);
            ingresarMatriz(A, filasA, columnasA, archivo);
            
            // Leer las dimensiones y la matriz B
            archivo >> filasB >> columnasB;
            double* B = crearMatriz(filasB, columnasB);
            ingresarMatriz(B, filasB, columnasB, archivo);
            
            double* C = nullptr; // Crear puntero para la matriz resultado
            
            if (op == 1) {
                C = add(A, B, filasA, columnasA, filasB, columnasB); // Guardamos el resultado de la suma
            } 
            else if (op == 2) {
                C = mul(A, B, filasA, columnasA, filasB, columnasB); // Guardamos el resultado de la multiplicación
            }
            
            // Imprimir el resultado solo si C no es nulo
            if (C != nullptr) {
                cout << "Resultado de la operacion:" << endl;
                imprimirMatriz(C, filasA, columnasB);
                eliminarMatriz(C); // Liberar la memoria de la matriz resultante
            }

            eliminarMatriz(A);
            eliminarMatriz(B);

            // Reiniciar el archivo para la próxima iteración
            archivo.clear();          // Limpiar el estado del archivo (en caso de que se haya encontrado un error)
            archivo.seekg(0, ios::beg); // Volver al principio del archivo
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




