#include <iostream> 
#include <cmath>
using namespace std;

/*FUNCIONES USADAS EN COMPROBACIONES
double f1(double x){
    return exp(-pow(x,2));
}
double f1_d(double x){
    return -2*x*exp(-pow(x,2));
}
double f2(double x){
    return x;
}
double f2_d(double x) {
    return 1;
}
*/

double f_resta(double x){
    return exp(-pow(x,2))-x;
}
double f_resta_d(double x){
    return -2*x*exp(-pow(x,2))-1;
}

double dicotomia(double (*f)(double),double &a, double &b, double &tol, int &maxit);
double NewtonRaphson(double (*f)(double), double (*f_d)(double), double &x0, double &tol, int &maxit);


int main(){
    double a=-8.;double b=5.; //Intervalo para dicotomia
    double tol= 1e-7;
    int maxit= 5000;
    double x0=-3; //Semilla para Newton-Raphson
    double raiz_dicotomia=0.; double raiz_newton=0.;double raiz_prueba=0.;

    /* COMPROBACIONES
    //Metodo dicotomia
    double dicotomia_f1=dicotomia(f1,a,b,tol,maxit);
    cout<<"dicotomia 1: "<<dicotomia_f1<<endl;
    double dicotomia_f2=dicotomia(f2,a,b,tol,maxit);
    cout<<"dicotomia 2: "<<dicotomia_f2<<endl;


    //Metodo Newton-Raphson
    double newton_f1=NewtonRaphson(f1,f1_d,x0,tol,maxit);
    cout<<" Newton 1: "<<newton_f1<<endl;
    double newton_f2=NewtonRaphson(f2,f2_d,x0,tol,maxit);
    cout<<" Newton 2: "<<newton_f2<<endl;
    */

    
    raiz_dicotomia=dicotomia(f_resta,a,b,tol,maxit);
    cout<<" El punto de interseccion segun dicotomia es x= "<<raiz_dicotomia<<endl;
    

    raiz_newton=NewtonRaphson(f_resta,f_resta_d,x0,tol,maxit);
    cout<<" El punto de interseccion segun Newton-Raphson es x= "<<raiz_newton<<endl; 
}


double dicotomia(double (*f)(double),double &a, double &b, double &tol, int &maxit){
    cout<<endl<<"METODO DE DICOTOMIA"<<endl;
    cout<<" Intervalo dicotomia: [a="<<a<<" , b="<<b<<"]"<<endl;
    
    if (f(a) * f(b) > 0) {
        cout<<" El metodo de dicotomia no se puede aplicar, no hay raíz en el intervalo [a, b]"<<endl;
        return NAN; 
    }

    double m;  // Punto medio
    int iter = 0;
    while ((b-a)/2>tol && iter<maxit) {
        m = (a+b)/2.0;
        
        if (f(m)==0) {
            break;
        }

        // Determinar el subintervalo donde se encuentra la raíz
        if (f(a)*f(m)<0) {
            b=m; 
        } else {
            a=m; 
        }

        iter++;
    }

    cout<<" Iteraciones metodo dicotomia: "<<iter<<endl;
    return (a+b)/2.0;
}


double NewtonRaphson(double (*f)(double), double (*f_d)(double), double &x0, double &tol, int &maxit) {
    cout<<endl<<"METODO DE NEWTON-RAPHSON"<<endl;
    double x=x0;
    int iter=0;

    while (iter < maxit) {
        double fx=f(x);
        double fdx=f_d(x);
        
        // Comprobamos si la derivada es cero
        if (fdx==1e-15) {
            cout<<"Error: Derivada igual a cero."<<endl;
            return NAN; 
        }

        double x_next=x-fx/fdx;

        if (fabs(x_next-x)<tol) {
            cout<<" Iteraciones metodo Newton-Raphson: "<<iter<<endl;
            return x_next;   
        }
        x=x_next;
        iter++;   
    }
    cout<<" Alcanzado el numero maximo de iteraciones"<<endl;
    return x;
}