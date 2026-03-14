#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
using namespace std;

double** leer_archivo(string nombre, int &dim1, int &dim2);

double producto_escalar(double **vectores, int &dim1, int &dim2);

int main(){
    int dim1=0;int dim2=0;
    string nombre="vectores.txt";
    double **vectores=leer_archivo(nombre,dim1,dim2);
    double p_escalar=producto_escalar(vectores,dim1,dim2);

    cout<<"El producto escalar es: "<<p_escalar<<endl;

    delete[] vectores;
}

double** leer_archivo(string nombre, int &dim1, int &dim2){
    ifstream FichIn;
    FichIn.open(nombre);
    if (FichIn.fail()){
        cout<<"Error al abrir el archivo "<<nombre<<endl;
        exit(0);
    }
    else{
        string linea;
        int fila=0;
        int dimensiones[2]={0,0};
        double **vectores = new double*[2];

        //Leemos el archivo linea a linea, guardando cada una en el array vectores y anotando las dimensiones
        while (getline(FichIn,linea)){ 
            if (fila>=2){
                cout<<"Error: El archivo 'vectores.txt' tiene más de dos vectores"<<endl;
                exit(0);
            }

            stringstream ss(linea);

            //Comprobamos la dimension del vector en esta linea
            double num;
            int dim=0.;
            while (ss>>num){
                dim++;
            }
            vectores[fila]=new double[dim]; 
    
            //Almacenamos el vector y lo mostramos por pantalla
            ss.clear();
            ss.str(linea);
            int i = 0;
            while (ss >> num) {
                vectores[fila][i++] = num;
            }
            cout<<"Vector "<<fila+1<<": ";
            for (int i=0;i<dim;i++) {
                cout << vectores[fila][i] << " ";
            }

            dimensiones[fila]= dim;
            fila ++;
            cout<<endl;
        }
        FichIn.close();
        dim1=dimensiones[0];
        dim2=dimensiones[1];

        return vectores;
    }  
}


double producto_escalar(double **vectores, int &dim1, int &dim2){
    if (dim1<2 || dim2<2){
        cout<<"Error: Los vectores tiene que tener como minimo dimension 2"<<endl;
        exit(0);
    }

    if (dim1 != dim2) {
        cout<<"Error: Los vectores no tienen la misma dimension"<<endl;
        exit(0);
    }

    double producto=0;
    for (int i=0;i<3;i++) {
        producto+=vectores[0][i]*vectores[1][i];
    }
return producto;
}

