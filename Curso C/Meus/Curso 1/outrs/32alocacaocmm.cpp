#include <stdio.h>
#include <stdlib.h>
#include <new>

//func princ prog
int main(){

    //defvars
    int tamanho, cont;

    //lendo o tamnho
    printf("digite o tamanho:");
    scanf("%d", &tamanho);

    //ccriando um ponteiro que recebe o vetor vazio
    int *vetor = new int(tamanho);

    //modificando e imprimindo valroes
    for(cont = 0; cont < tamanho; cont++){
        vetor[cont] = cont;
        printf("\n%d", vetro[cont]);

    }



    return 0;

}
