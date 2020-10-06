#include <stdio.h>
#include <stdlib.h>

int* alocaVetor(int tamanho){

    //é criado um ponteiro auxiliar
    int *aux;

    //alocacao dinamica de memoria
    aux = (int*) malloc(tamanho * sizeof(int));


    //retorna o pointeiro que aloca a primeria posição de memoria
    return aux;

}


//func princ prog
int main(){

    //definindo vars
    int *vetor, tamanho, cont;

    //lendo o tamanho
    printf("digite o tamanho do vet:");
    scanf("%d", &tamanho);

    //ponteiro recebe o endereco dememoria que foi alocado ao vetor
    vetor = alocaVetor(tamanho);


    //coloca valores no vetor

     for(cont = 0; cont < tamanho; cont++){
        vetor[cont] = 90;

    }

    //imrprime vetor
    for(cont = 0; cont < tamanho; cont++){
        printf("%d\n", vetor[cont]);

    }

    free (vetor);

    return 0;

}
