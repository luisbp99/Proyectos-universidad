#include <iostream>
#include <cmath> 
using namespace std;
#include "punto.h"

#ifndef _Triangulo_h_
#define _Triangulo_h_

class Triangulo {
    private:
        Punto *ptos; //Puntero simple aun array de 3 puntos
    public:

        // Constructores
        Triangulo();
        Triangulo(const Punto& p1, const Punto& p2, const Punto& p3);
        Triangulo(double *coordinates);
        Triangulo(Punto *ptos);
        Triangulo(const Triangulo& other);

        // Destructor
        ~Triangulo();

        // Metodos
        Punto getVertex(int index); 
        void setVertices(const Punto& p1, const Punto& p2, const Punto& p3);
        void setVertices(Punto *points);
        void setVertex(int index, const Punto& p);
        double area();
        bool intersects(const Triangulo& other);
        void print();
};
        


#endif