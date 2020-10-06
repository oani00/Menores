#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//funcao principal do programa
void main(){

    //alimentar o rand
    srand((unsigned)time(NULL));

    //variavel que recebe o resto da div do n por 3 (aletorio entre 0 e 2)
    int aleatorio = rand() % 3;

    //variavel que recebe o resto da div por 5 (aletorio entre 1 e 5)
    int aleatoriosegundo = (rand() % 5) + 1;


    //imprime o valor
    printf("%d", aleatoriosegundo);


    //pausa
    system("pause");


}
