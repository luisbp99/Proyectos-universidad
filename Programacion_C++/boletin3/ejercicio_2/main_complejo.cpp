#include "Complejo.h"

int main() {
    Complejo z1(3., 4.);
    Complejo z2=Complejo(z1);
    Complejo z3(5., 6.);
    cout << "z1: " << z1 << endl;
    cout << "z2: " << z2 << endl;
    cout << "z3: " << z3 << endl;

    z1=z3;
    cout << "z1: " << z1 << endl;
    cout << "z2: " << z2 << endl;
    cout << "z3: " << z3 << endl;

    cout << "Conjugado de z1: " << z1.conjugado() << endl;
    cout << "Suma (z1 + z2): " << z1 + z2 << endl;
    cout << "Resta (z1 - z2): " << z1 - z2 << endl;
    cout << "Multiplicacion (z1 * z2): " << z1 * z2 << endl;
    cout << "Division (z1 / z2): " << z1 / z2 << endl;
    
    cout << "¿z1 == z2? " << (z1 == z2 ? "Si" : "No") << endl;
    cout << "¿z1 == z3? " << (z1 == z3 ? "Si" : "No") << endl;
    cout << "¿z1 != z2? " << (z1 != z2 ? "Si" : "No") << endl;
    cout << "¿z1 != z3? " << (z1 != z3 ? "Si" : "No") << endl;

}