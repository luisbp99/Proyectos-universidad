#include"malla.h"

malla::malla(){
    np = 0;
    Points = NULL;
}

malla::~malla(){
    if (Points!=NULL){
        delete[] Points;
    }
}

void malla::LecPuntos(string filename){
    double x,y;
    ifstream FilePoints;
    FilePoints.open(filename);
    FilePoints >> this->np;
    this->Points = new Punto[this->np];
    for (unsigned int i=0;i<this->np;i++){
        FilePoints >> x;
        FilePoints >> y;

        this->Points[i].setX(x);
        this->Points[i].setY(y);
    }
    FilePoints.close();
}

void malla::PrintPoints(){
    for (unsigned int i=0;i<this->np;i++){
        this->Points[i].print();
    }
}

void malla::AisgTriangulos(string filename){
    int *index;
    index = new int[3];
    ifstream FileElements;
    FileElements.open(filename);
    FileElements >> this->nt;
    this->T = new Triangulo[this->nt];
    
    for (unsigned int i=0;i<this->nt;i++){
        for (unsigned int j=0;j<3;j++){
            FileElements >> index[j];
        }
        this->T[i].setVertices(this->Points[index[0]], this->Points[index[1]], this->Points[index[2]]);
    }
    FileElements.close();
}

void malla::printElements(){
    for (unsigned int i=0;i<this->nt;i++){
        this->T[i].print();
    }
}

void malla::PrintArea(){
    double Area = 0;
    for (unsigned int i=0;i<this->nt;i++){
        cout<<"Area del elemento "<<i<<" : "<<this->T[i].area()<<endl;
        Area += T[i].area();
    }
    cout<<"El area total es: "<<Area<<endl;
}
