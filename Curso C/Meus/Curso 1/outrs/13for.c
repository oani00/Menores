#include <stdio.h>
#include <stdlib.h>

//func princ prog
void main(){

    //def vars
    int cont;

    //contando ate 10

    for(cont = 1; cont <= 10; cont++){
        printf("\n 5 x %d = %d", cont, 5 * cont);
    }

    //contando de 2 em 2
    for(cont = 1; cont <= 10; cont = cont + 2){
        printf("\n%d ", cont);
    }


    //pausa
    system("pause");


}
