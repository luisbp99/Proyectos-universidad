#include <iostream>
#include <fstream>

using namespace std;

int main() {
    // Escritura en el archivo
    ofstream FichOut;
    FichOut.open("notas.txt"); // Nombre del archivo corregido

    if (!FichOut) {
        cout << "\nIncapaz de crear o abrir el fichero" << endl;
        return 1; // Salimos del programa con error
    } else {
        FichOut << "Alumno1\t" << 5.5 << "\tAPROBADO" << endl;
        FichOut << "Alumno2\t" << 3.5 << "\tSUSPENSO" << endl;
        FichOut << "Alumno3\t" << 9.0 << "\tSOBRESALIENTE" << endl;
        FichOut.close(); // Cerramos el fichero
    }

    // Lectura del archivo
    ifstream FichIn;
    FichIn.open("notas.txt"); // Nombre del archivo corregido

    if (!FichIn) {
        cout << "\nIncapaz de abrir el fichero" << endl;
        return 1; // Salimos del programa con error
    } 

    string aux, nota_txt;
    int num_aprob = 0;
    double nota;

    // Bucle de lectura mejorado
    while (FichIn >> aux >> nota >> nota_txt) {
        cout << "Alumno: " << aux << " | Nota: " << nota << " | Estado: " << nota_txt << endl;
        if (nota >= 5) num_aprob++;
    }

    FichIn.close(); // Cerramos el fichero
    cout << "Número de aprobados: " << num_aprob << endl;

    return 0;
}
