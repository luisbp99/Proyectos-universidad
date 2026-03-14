#include<iostream>
#include<fstream>
using namespace std;

double leer_archivos(string nombre){
    ifstream FichIn;
    FichIn.open(nombre);
    if (FichIn.fail()){
        cout<<"Error al abrir el archivo "<<nombre<<endl;
        exit(0);
    }
    else{
        int n;
        double **A;
        double *b,*x0;

    }
}

int main(){

}
