#include "Triangulo.h"

int main() {
    double x, y;
    Punto ptos[3];

    // Obtenemos los vértices del triángulo del usuario
    for (int i = 0; i < 3; i++) {
        cout << "Introduce las coordenadas del vértice " << i + 1 << " (x y): ";
        cin >> x >> y;
        ptos[i] = Punto(x, y);
    }

    // Creamos un triángulo con los vértices proporcionados por el usuario
    Triangulo t1(ptos);
    t1.print();

    //Calculamos el área del triángulo
    cout << "Área del triángulo: " << t1.area() << endl;

    // Verificamos si el triángulo interseca con otro triángulo
    Triangulo t2(Punto(0, 0), Punto(3, 0), Punto(0, 4)); // Triángulo de ejemplo
    if (t1.intersects(t2)) {
        cout << "Los triángulos tienen un lado común." << endl;
    } else {
        cout << "Los triángulos no tienen un lado común." << endl;
    }

    return 0;
}