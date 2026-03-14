#include <iostream>
#include <vector>
#include <chrono>

using namespace std;
using namespace chrono;

// Función para intercambiar el contenido de dos vectores dinámicos
void intercambiarContenido(double* v1, double* v2, size_t size) {
    for (int i = 0; i < size; i++) {
        double copia = v1[i];
        v1[i] = v2[i];
        v2[i] = copia;
    }
}

// Función para intercambiar los punteros de los vectores
void intercambiarPunteros(double*& v1, double*& v2) {
    double* copia = v1;
    v1 = v2;
    v2 = copia;
}

int main() {
    // Definir tamaño grande del vector
    int longitud = 10000000;  // 10 millones de elementos
    double* v1 = new double[longitud];
    double* v2 = new double[longitud];

    // Inicializar los vectores
    for (int i = 0; i < longitud; i++) {
        v1[i] = 1.0;
        v2[i] = 2.0;
    }
  
    int num_intercambios[] = {1000, 5000, 10000};

    // Medir el tiempo para cada cantidad de intercambios
    for (int intercambios : num_intercambios) { 
    
      auto antes1 = high_resolution_clock::now();
      for (int i= 0; i<intercambios; i++){
        intercambiarContenido(v1, v2, longitud);
      }
      auto  despues1= high_resolution_clock::now();
      duration<double> tiempo1 = despues1 - antes1;
      cout << "Tiempo de intercambio de contenido con "<< intercambios<<" intercambios: " << tiempo1.count() << " segundos" << endl;
      
      // Medir el tiempo del intercambio de punteros


      auto antes2 = high_resolution_clock::now();
      for (int i= 0; i<intercambios; i++){
        intercambiarPunteros(v1, v2);
      }
      auto  despues2= high_resolution_clock::now();
      duration<double> tiempo2 = despues2 - antes2;
      cout << "Tiempo de intercambio de punteros con "<< intercambios<<" intercambios: " << tiempo2.count() << " segundos" << endl;
    }
    // Liberar memoria
    delete[] v1;
    delete[] v2;

    return 0;
}
