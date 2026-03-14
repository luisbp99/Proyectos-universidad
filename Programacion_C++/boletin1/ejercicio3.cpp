#include<iostream>
using namespace std;

int main(){
    double a, b;
    short int op; 
    bool repetir = true;

    while (repetir){

        cout<<"------------------------"<<endl;
        cout<<"Operacion a realizar"<<endl;
        cout<<"1: Suma"<<endl;
        cout<<"2: Resta"<<endl;
        cout<<"3: Multiplicacion"<<endl;
        cout<<"4: Division"<<endl;
        cout<<"5: Salir"<<endl;
        cin>>op;

        switch (op){
            case 1:
                cout<<"Introduzca los numeros que quiere sumar"<<endl;
                cin>>a>>b;
                cout<<"La suma es: "<<a+b<<endl;
                break;
            case 2:
                cout<<"Introduzca los numeros que quiere restar"<<endl;
                cin>>a>>b;
                cout<<"La resta es: "<<a-b<<endl;
                break;
            case 3:
                cout<<"Introduzca los numeros que quiere multiplicar"<<endl;
                cin>>a>>b;
                cout<<"El producto es: "<<a*b<<endl;
                break;
            case 4:
                cout<<"Introduzca los numeros que quiere dividir"<<endl;
                cin>>a>>b;
                cout<<"La division es: "<<a/b<<endl;
                break;
            case 5:
                repetir = false;
                break;
            default:
                cout<<"La operacion no esta definida"<<endl;
        }
    }
}
