#include <stdio.h>
#include <stdlib.h>

int retornaComMaisDez(int numero){
    return numero + 10;
}


//func princ prog
int main(){

    //def var
    int a = 5;

    //mostrando o valor
    printf("%d \n", a);

    //retorna 10
    a = retornaComMaisDez(a);

    //mostrando o valor
    printf("%d \n", a);




    return 0;

}
