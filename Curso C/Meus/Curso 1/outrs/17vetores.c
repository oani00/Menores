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
    printf("\nposi��o 0: %d", vetor[0]);
    printf("\nposi��o 1: %d", vetor[1]);
    printf("\nposi��o 2: %d", vetor[2]);

    //imprimir num la�o de repeticao
    for(cont = 0; cont <3; cont++){
        printf("\nposi��o %d: %d", cont, vetor[cont]);
    }

    //pausa
    system("pause");


}
