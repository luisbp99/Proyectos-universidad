#include <iostream>
#include <cmath>
using namespace std;


// Función sobrecargada para calcular el área de un triángulo
double area(double base, double altura) {
    return (base * altura) / 2;
}

// Función sobrecargada para calcular el área de un cuadrado
double area(double lado) {
    return lado * lado;
}

// Función sobrecargada para calcular el área de un rectángulo
double area(double base, double altura, bool esRectangulo) {
    return base * altura;
}

// Función sobrecargada para calcular el área de un círculo
double area(double radio, bool esCirculo) {
    return M_PI * radio * radio;
}

// Función sobrecargada para calcular el área de un trapecio
double area(double baseMayor, double baseMenor, double altura) {
    return ((baseMayor + baseMenor) * altura) / 2;
}

int main() {
    cout << "Área de un triángulo (base 10, altura 5): " << area(10.0, 5.0) << endl;
    cout << "Área de un cuadrado (lado 4): " << area(4.0) << endl;
    cout << "Área de un rectángulo (base 6, altura 3): " << area(6.0, 3.0, true) << endl;
    cout << "Área de un círculo (radio 7): " << area(7.0, true) << endl;
    cout << "Área de un trapecio (base mayor 8, base menor 4, altura 5): " << area(8.0, 4.0, 5.0) << endl;
    
    return 0;
}