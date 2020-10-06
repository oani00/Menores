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

int main(){

    int vetor[TAM] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    int x, y, aux;

    //valor da esquerda sendo analisado
    for(x = 0; x < TAM; x++){

        //valor da direita sendo analisado
        for(y = x+1; y < TAM; y++){

            //confere se precisa fazer a troca
            if(vetor[x] > vetor[y]){
                aux = vetor[x];
                vetor[x] = vetor[y];
                vetor[y] = aux;
            }

        }

    }

    imprimeVetor(vetor);

    return 0;

}
