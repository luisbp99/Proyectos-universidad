#include<iostream>
#include<math.h>
#include<stdlib.h>
using namespace std;

struct Punto{
    double x;
    double y;
};

int main(){
    struct Punto p1;
    int N_total, N_aciertos=0;
    double distancia, aprox_pi;

    cout<<"Introduzca el numero total de puntos a genrear"<<endl;
    cin>>N_total;

    for (int i=0;i<N_total;i++){
        p1.x = double(rand())/RAND_MAX;
        p1.y = double(rand())/RAND_MAX;
        //cout<<"Punto generado ("<<p1.x<<" , "<<p1.y<<")"<<endl;
        distancia = sqrt(pow(p1.x,2)+pow(p1.y,2));
        if (distancia<1){
            N_aciertos += 1;
        }
    }

    aprox_pi = 4.0*N_aciertos/N_total;

    cout<<"El valor de pi que obtenemos para "<<N_total<<" puntos es "<<aprox_pi<<endl;
}
