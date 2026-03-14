#include<iostream>
using namespace std;

double suma_parcial(int &n);

int main(){
    int m; //Numero de terminos de la serie
    double suma;

    //Pedimos el numero de terminos de la suma por terminal
    cout<<"Introduzca el numero de terminos de la suma"<<endl;
    cin>>m;

    suma = suma_parcial(m);

    cout<<"La suma parcial con "<<m<<" terminos vale "<<suma<<endl;
}

double suma_parcial(int &n){
    double suma = 0.25; //Inicializamos la suma con valor 0.25 para empezar la suma parcial en i=1.
    double factorial = 1, potencia = 1;
    for (int i=1; i<=n; i++){
        factorial *= i;
        //cout<<"factorial en el loop "<<i<<" vale "<<factorial<<endl;
        potencia *= 3;
        //cout<<"potencia en el loop "<<i<<" vale "<<potencia<<endl;
        suma += potencia/(3+factorial);
    }
    return suma;
}
