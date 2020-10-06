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

void insertion_sort(int vetor[TAM]){

    int i, j, atual;

    for(i = 1; i < TAM; i++){

        //elemento atual em analise
        atual = vetor[i];


        //elemento anterior ao analisado
        j = i - 1;

        //analisando membros anteriores
        while((j >= 0) && (atual < vetor[j])){


            //reposiciona os elementos 1 pos para frente
            vetor[j + 1] = vetor[j];


            //faz o j andar p tras
            j = j -1;
        }

        //agora que o espaco foi aberto colocamos o atual na posicao correta
        vetor[j + 1] = atual;

        imprimeVetor(vetor);


    }


}


int main(){

    int vetor[TAM] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};

    insertion_sort(vetor);





    return 0;

}
