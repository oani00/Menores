#include <iostream>
#include <string>
#include <stdlib.h>
#define TAM 10

using namespace std; //para utilizar cout

void imprimeVetor(int vetor[]){
    int i;
    cout << "\n";
    for (i = 0; i < TAM; i++){
        cout << " |" << vetor[i] << "| ";
    }

}

void quick_sort(int vetor[TAM], int inicio, int fim){

    int pivo, esq, dir, meio, aux;

    //limites da esquerda e direita da regiao analisada
    esq = inicio;
    dir = fim;

    //ajustando auxiliares do centro
    meio = (int) ((esq + dir) / 2);
    pivo = vetor[meio];


    while(dir > esq){

        while(vetor[esq] < pivo){
            esq = esq + 1;
        }

        while(vetor[dir] > pivo){
            dir = dir - 1;
        }

        if(esq <= dir){

            //realiza uma troca
            aux = vetor[esq];
            vetor[esq] = vetor[dir];
            vetor[dir] = aux;


            //faz os limites laterais caminharem para o centro
            esq = esq + 1;
            dir = dir - 1;

        }
    }

    imprimeVetor(vetor);

    //recursao para continuar ordenando
    if(inicio < dir){
        quick_sort(vetor, inicio, dir);
    }

    if(esq < fim){
        quick_sort(vetor, esq, fim);
    }

}


int main(){

    int vetor[TAM] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};

    quick_sort(vetor, 0, TAM);




    return 0;

}
