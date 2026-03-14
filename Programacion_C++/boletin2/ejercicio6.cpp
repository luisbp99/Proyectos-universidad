#include<iostream>
#include<math.h>
using namespace std;

struct Punto{
    double x,y;

    void print(){
        cout<<"Las coordenadas del punto son ( "<<x<<" , "<<y<<" )"<<endl;
    }
};

double distancia(struct Punto *p1, struct Punto *p2){
    return sqrt(pow(p1->x-p2->x,2)+pow(p1->y-p2->y,2));
}

struct Triangulo{
    struct Punto *p1,*p2,*p3;

    void Perimetro(){
        double a=distancia(p1,p2);
        double b=distancia(p2,p3);
        double c=distancia(p3,p1);
        cout<<"El perimetro del triangulo es: "<<a+b+c<<endl;
    }    

    void area(){
        double ar = 0.5*abs((p2->x-p1->x)*(p3->y-p1->y)-(p2->y-p1->y)*(p3->x-p1->x));
        cout<<"El area del triangulo es: "<<ar<<endl;
    }
};

int main(){
    struct Punto puntos[3];
    struct Triangulo tri;

    //Pedimos al usuario que introduzca las coordenadas de los puntos
    for (int i=0;i<3;i++){
        cout<<"Introduzca las coordenadas del punto "<<i+1<<" (x , y)"<<endl;
        cin>>puntos[i].x>>puntos[i].y;
    }

    //Imprimimos las coordenadas para comprobar que se guardan correctamente
    cout<<"Las coordenadas de los puntos son"<<endl;
    for (int i=0;i<3;i++){
        puntos[i].print();
    }
    
    //Asignamos los vertices del triangulo con los puntos introducidos
    tri.p1 = &puntos[0];
    tri.p2 = &puntos[1];
    tri.p3 = &puntos[2];

    /*Comprobamos que los vertices del triangulo tienen los valores que queremos
    cout<<"Las coordenadas de los puntos son:"<<endl;
    cout<<"Las coordenadas del punto son ( "<<tri.p1->x<<" , "<<tri.p1->y<<" )"<<endl;
    cout<<"Las coordenadas del punto son ( "<<tri.p2->x<<" , "<<tri.p2->y<<" )"<<endl;
    cout<<"Las coordenadas del punto son ( "<<tri.p3->x<<" , "<<tri.p3->y<<" )"<<endl;*/

    cout<<"Comprobamos las direcciones de memoria para saber que los puntos no estan duplicados"<<endl;
    cout<<"Dir punto1: "<<&puntos[0]<<"   dir vertice1: "<<tri.p1<<endl;
    cout<<"Dir punto2: "<<&puntos[1]<<"   dir vertice2: "<<tri.p2<<endl;
    cout<<"Dir punto3: "<<&puntos[2]<<"   dir vertice3: "<<tri.p3<<endl;

    tri.Perimetro();
    tri.area();
    
}
