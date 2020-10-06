#include <stdio.h>
#include <stdlib.h>

void mostraSoma(int primeiroValor, int segundoValor ){
    printf("\n a soma entre %d e %d é %d", primeiroValor, segundoValor, primeiroValor + segundoValor);
}

//func princ prog
int main(){

    //definidno vars
    int a = 5, b = 7;

    //mostra soma
    mostraSoma(a,b);



    return 0;

}
