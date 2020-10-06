#include <stdio.h>
#include <stdlib.h>


void imprimeVetor(int *vetor, int tamanho){

    int i;

    //percorrendo o vetor
    for(i = 0; i < tamanho; i++){
        printf("%d \n", vetor[i]);

    }

}

void modificaVetor(int *vetor, int tamanho){

 int i;

    //percorrendo o vetor
    for(i = 0; i < tamanho; i++){
        vetor[i] = vetor[i] + 1;
    }
}


//func princ prog
int main(){

    //definindo vetor
    int v[3] = {1,2,3};

    //mostrando o vetor
    imprimeVetor(v, 3);

    //modifica o vetor
    modificaVetor(v, 3);

    //mostrando o vetor
    imprimeVetor(v, 3);






    return 0;

}
