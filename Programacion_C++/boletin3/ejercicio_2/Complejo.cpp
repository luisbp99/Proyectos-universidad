 #include "Complejo.h"
 using namespace std;
 
 // Constructor por defecto
 Complejo::Complejo(){
        this->real = 0;
        this->imaginario = 0;
 }

 // Constructor con parámetros
 Complejo::Complejo(double r, double i){
        this->real = r;
        this->imaginario = i;
    }

 // Constructor de copia
 Complejo::Complejo(const Complejo& other){
        this->real = other.real;
        this->imaginario = other.imaginario;
    }   



// Operacion: Conjugado
Complejo Complejo::conjugado(){
    return Complejo(this->real, -this->imaginario);
}

 // Operacion: Suma
 Complejo Complejo::operator+(const Complejo& other){
    return Complejo(this->real + other.real, this->imaginario + other.imaginario);
}

 // Operacion: Resta
 Complejo Complejo::operator-(const Complejo& other){
     return Complejo(this->real - other.real, this->imaginario - other.imaginario);
 }

// Operacion: Producto
Complejo Complejo::operator*(const Complejo& other){
    return Complejo(this->real*other.real - this->imaginario*other.imaginario, 
                    this->real*other.imaginario + this->imaginario*other.real);
}

// Operacion: Division
Complejo Complejo::operator/(const Complejo& other){
    double denom = other.real*other.real + other.imaginario*other.imaginario;
    if (denom == 0.0) {
        throw runtime_error("División entre cero no permitida");
    }
    return Complejo((this->real*other.real + this->imaginario*other.imaginario) / denom,
                    (this->imaginario*other.real - this->real*other.imaginario) / denom);
}

// Operador de asignación =
Complejo Complejo::operator=(const Complejo& other){
    if (this != &other) {
        this->real = other.real;
        this->imaginario = other.imaginario;
    }
    return *this;
}

// Operador de igualdad ==
bool Complejo::operator==(const Complejo& other){
    return (this->real == other.real) && (this->imaginario == other.imaginario);
 }

 // Operador de desigualdad !=
 bool Complejo::operator!=(const Complejo& other){
     return !(*this == other);
 }

//Operador de salida << para imprimir un número complejo
ostream& operator<<(ostream& co, const Complejo& other){
    co<<other.real;
    if (other.imaginario >= 0) co<<" + " <<other.imaginario<<"i";
    else co <<" - "<< -other.imaginario<<"i";
    return co;
}

 /*
 
 // Operador de salida << para imprimir un número complejo
 friend ostream& operator<<(ostream& os, const Complejo& otro) {
     os << otro.real;
     if (otro.imaginario >= 0) os << " + " << otro.imaginario << "i";
     else os << " - " << -otro.imaginario << "i";
     return os;
 }
 */

 // Destructor
    Complejo::~Complejo(){
    }

