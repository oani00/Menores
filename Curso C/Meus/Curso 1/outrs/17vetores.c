#include <stdio.h>
#include <stdlib.h>


//func princ prog
void main(){

    //imprime na tela
    int vetor[3],cont;

    //valores p o vetor
    vetor[0] = 5;
    vetor[1] = 10;
    vetor[2] = 15;

    //exibir
    printf("\nposição 0: %d", vetor[0]);
    printf("\nposição 1: %d", vetor[1]);
    printf("\nposição 2: %d", vetor[2]);

    //imprimir num laço de repeticao
    for(cont = 0; cont <3; cont++){
        printf("\nposição %d: %d", cont, vetor[cont]);
    }

    //pausa
    system("pause");


}
