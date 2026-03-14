#include <iostream>
using namespace std;

#ifndef _Complejo_h_
#define _Complejo_h_

class Complejo {
    private:
        double real, imaginario;
    public:
        //Constructores
        Complejo();
        Complejo(double r, double i);
        Complejo(const Complejo &other);

        //Destructor
        ~Complejo();

        //Sobrecarga de operadores
        Complejo conjugado();
        Complejo operator+(const Complejo& other);
        Complejo operator-(const Complejo& other);
        Complejo operator*(const Complejo& other);
        Complejo operator/(const Complejo& other);  
        Complejo operator=(const Complejo& other);
        bool operator==(const Complejo& other);
        bool operator!=(const Complejo& other);
        friend ostream& operator<<(ostream& co, const Complejo& c);
        
        /*
        
        friend ostream& operator<<(ostream& os, const Complejo& c) {
            os << c.real << " + " << c.imaginario << "i";
            return os;
        }
            */
      
};


#endif

