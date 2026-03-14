#include "Triangulo.h"

Triangulo::Triangulo() {
    ptos = new Punto[3];
}

// Constructor con tres puntos
Triangulo::Triangulo(const Punto& p1, const Punto& p2, const Punto& p3) {
    this->ptos = new Punto[3];
    ptos[0] = p1;
    ptos[1] = p2;
    ptos[2] = p3;
}

// Constructor con un vector de coordenadas (x1, y1, x2, y2, x3, y3)
Triangulo::Triangulo(double *coordinates) {
    ptos = new Punto[3];
    ptos[0] = Punto(coordinates[0], coordinates[1]);
    ptos[1] = Punto(coordinates[2], coordinates[3]);
    ptos[2] = Punto(coordinates[4], coordinates[5]);
}

// Constructor con un puntero a puntos
Triangulo::Triangulo(Punto *ptos) {
    this->ptos = new Punto[3];
    this->ptos[0] = ptos[0];
    this->ptos[1] = ptos[1];
    this->ptos[2] = ptos[2];
}

// Constructor de copia
Triangulo::Triangulo(const Triangulo& other) {
    ptos = new Punto[3];
    ptos[0] = other.ptos[0];
    ptos[1] = other.ptos[1];
    ptos[2] = other.ptos[2];
}


// Metodo para obtener el i-esimo punto (devuelve un objeto Punto)
Punto Triangulo::getVertex(int index){
    if (index >= 0 && index < 3) {
        return ptos[index];
    }
    throw out_of_range("Index out of range");
}

// Metodo para establecer los vertices con tres puntos
void Triangulo::setVertices(const Punto& p1, const Punto& p2, const Punto& p3) {
    ptos[0] = p1;
    ptos[1] = p2;
    ptos[2] = p3;
}

// Metodo para establecer los vertices con un puntero a Puntos
void Triangulo::setVertices(Punto *points) {
    ptos[0] = points[0];
    ptos[1] = points[1];
    ptos[2] = points[2];
}

// Metodo para modificar el i-esimo vertice
void Triangulo::setVertex(int index, const Punto& p) {
    if (index >= 0 && index < 3) {
        ptos[index] = p;
    } else {
        throw out_of_range("Index out of range");
    }
}

// Metodo para calcular el area del triangulo
double Triangulo::area(){
    double x1 = ptos[0].getX(), y1 = ptos[0].getY();
    double x2 = ptos[1].getX(), y2 = ptos[1].getY();
    double x3 = ptos[2].getX(), y3 = ptos[2].getY();
    return std::abs(x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2))/ 2.0;
}

// Metodo para comprobar si el triangulo interseca con otro triangulo
bool Triangulo::intersects(const Triangulo& other){
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (ptos[i].getX() == other.ptos[j].getX() &&
                ptos[i].getY() == other.ptos[j].getY()) {
                return true; 
            }
        }
    }
    return false;
}

// Metodo para imprimir los vertices del triangulo
void Triangulo::print(){
    cout << "Vertices del triangulo:" << endl;
    for (int i = 0; i < 3; i++) {
        cout << "Vertice " << i + 1 << ": ";
        ptos[i].print();
        cout << endl;
    }
}

// Destructor
Triangulo::~Triangulo() {
    delete[] ptos; 
}