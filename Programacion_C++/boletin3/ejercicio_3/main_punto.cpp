#include "punto.h"

int main() {
    double x, y, dx, dy;

    // Obtener las coordenadas iniciales del usuario
    cout << "Introduzca las coordenadas iniciales (x y): ";
    cin >> x >> y;
    Punto p(x, y); // Crear un punto con las coordenadas proporcionadas por el usuario
    cout << "Coordenadas iniciales: ";
    p.print(); // Imprimir las coordenadas iniciales

    // Obtener los valores de traslación (dx, dy) del usuario
    cout << "Introduzca los valores de traslación (dx dy): ";
    cin >> dx >> dy;
    p.trasladar(dx, dy); // Trasladar el punto por (dx, dy)
    cout << "Coordenadas después de la traslación por (dx, dy): ";
    p.print(); // Imprimir las coordenadas trasladadas

    // Obtener las coordenadas de otro punto para la traslación
    cout << "Introduzca las coordenadas de otro punto (x y) para la traslación: ";
    cin >> x >> y;
    Punto otroPunto(x, y); // Crear otro punto con las coordenadas proporcionadas por el usuario
    p.trasladar(otroPunto); // Trasladar el punto por otro punto
    cout << "Coordenadas después de la traslación por otro punto: ";
    p.print(); // Imprimir las coordenadas trasladadas

    return 0;
}
