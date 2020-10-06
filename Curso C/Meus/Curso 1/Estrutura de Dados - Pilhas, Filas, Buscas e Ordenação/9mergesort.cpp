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

//junta os dois sub arrays criados ao dividir o vetor principal
void merge(int vetor[TAM], int indiceEsquerdo, int meio, int indiceDireito){

    int i, j, k;
    int n1 = meio - indiceEsquerdo + 1;
    int n2 = indiceDireito - meio;


    //cria dois arrays temporarios
    int vetorEsquerdo[n1], vetorDireito[n2];

    //passa os elementos do vetor principal par ao primeiro vetor auxiliar
    for(i = 0; i < n1; i++){
        vetorEsquerdo[i] = vetor[indiceEsquerdo + i]
    }

    //passa os elementos do vetor principal par ao segundo vetor auxiliar
    for(i = 0; i < n1; j++){
        vetorDireito[j] = vetor[meio + 1 + j]
    }

    i = 0;
    j = 0;
    k = indiceEsquerdo;

    while(i < n1 && j < n2){

        if (vetorEsquerdo[i] <= vetorDireito[j]){

            vetor[k] = vetorEsquerdo[i];

            i++;

        }else{

            vetor[k] = vetorDireito[j];

            j++;

        }

        k++

    }

    while(i < n1){
        vetor[k] = vetorEsquerdo[i];
        i++;
        k++;
    }

    while(j < n2){
        vetor[k] = vetorEsquerdo[j];
        j++;
        k++;
    }



}

void merge_sort(int vetor[TAM], int indiceEsquerdo, int indiceDireito){

    if(indiceEsquerdo < indiceDireito){

        //encontra o meio
        int meio = indiceEsquerdo + (indiceDireito-indiceEsquerdo)/2;

        //da metade para tras
        merge_sort(vetor, indiceEsquerdo, meio);


        //da metade para frente
        merge_sort(vetor, meio + 1, indiceDireito);

        //une os dois sub arrays que foram criados
        merge(vetor, indiceEsquerdo, meio, indiceDireito);

    }

}


int main(){

    int vetor[TAM] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};

    merge_sort(vetor, 0, TAM - 1);

    imprimeVetor(vetor)


    return 0;

}
