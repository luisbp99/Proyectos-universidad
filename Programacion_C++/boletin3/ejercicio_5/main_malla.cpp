#include "malla.h"

int main(){
    malla M;
    M.LecPuntos("points.txt");
    M.PrintPoints();
    M.AisgTriangulos("elementos.txt");
    M.printElements();

    M.PrintArea();
}
