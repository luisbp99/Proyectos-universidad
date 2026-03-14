#include "punto.h"


// Constructor por defecto
Punto::Punto(){
    this->x=0.;
    this->y=0.;
}

// Constructor con parametros
Punto::Punto(double x, double y){
    this->x=x;
    this->y=y;
}

// Constructor de copia
Punto::Punto(const Punto& otro){
    this->x=otro.x;
    this->y=otro.y; 
}

// Metodo para obtener el valor de x
double Punto::getX(){
    return this->x;
}

// Metodo para establecer el valor de x
void Punto::setX(double x) {
    this->x=x;
}

// Metodo para obtener el valor de y
double Punto::getY(){
    return this->y;
}

// Metodo para establecer el valor de y
void Punto::setY(double y) {
    this->y=y;
}

// Metodo para imprimir los valores de x e y
void Punto::print(){
    cout<<"v=["<<x<<", "<<y<<"]"<<endl;
}

// Metodo para trasladar el punto por un valor dx y dy
void Punto::trasladar(double dx, double dy) {
    this->x+=dx;
    this->y+=dy;
}

// Metodo para trasladar el punto sumandole otro punto
void Punto::trasladar(const Punto& other) {
    this->x+=other.x;
    this->y+=other.y;
}


// Destructor
Punto::~Punto(){

}

