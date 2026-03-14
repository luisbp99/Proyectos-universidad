#include <iostream>
using namespace std;

#ifndef _punto_h_
#define _punto_h_

class Punto {
    private:
        double x; // Coordinate x
        double y; // Coordinate y
    public:
        // Constructores
        Punto();
        Punto(double x, double y);
        Punto(const Punto& otro);

        // Destructor
        ~Punto();

        // Metodos
        double getX();
        void setX(double x);
        double getY();
        void setY(double y);
        void print();
        void trasladar(double dx, double dy);
        void trasladar(const Punto& other);
};

#endif