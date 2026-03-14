#include<iostream>
using namespace std;
#include "punto.h"
#include "Triangulo.h"
#include<fstream>

#ifndef _malla_h_
#define _malla_h_

class malla{

    private:
        unsigned int np;
        Punto *Points;
        unsigned int nt;
        Triangulo *T;
    public:
        malla();
        ~malla();

        //Lectura de puntos desde fichero de mallado
        void LecPuntos(string filename);
        void PrintPoints();

        //Asignacion de puntos a los diferentes triangulos
        void AisgTriangulos(string filename);
        void printElements();

        void PrintArea();
};

#endif
