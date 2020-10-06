#include <iostream>
#include <string>
#include <stdlib.h>
#define TAM 10

using namespace std; //para utilizar cout

void imprime_vetor(int vetor[TAM]){

    int cont;

    cout << "\n";

    for(cont = 0; cont < TAM; cont++){
        cout << vetor[cont] << " - ";
    }
}

void pilha_push(int pilha[TAM], int valor, int *topo){

  //caso n possa colocar mais valores
    if(*topo == TAM -1){
        cout << "pilha cheia";
    }else{
        *topo = *topo + 1;
        pilha[*topo] = valor;
    }

}

void pilha_pop(int pilha[TAM], int *topo){

    if(*topo == -1){
        cout << "a pilha ja esta vazia";
    }else{
        cout << "valor removido:" << pilha[*topo];
        *topo = *topo -1;
    }

}

int main(){

    int pilha[TAM] = {0,0,0,0,0,0,0,0,0,0};
    int topo = -1;           //Topo da pilha

    imprime_vetor(pilha);

    pilha_push(pilha, 5, &topo);
    imprime_vetor(pilha);

    pilha_push(pilha, 7, &topo);
    imprime_vetor(pilha);

    pilha_pop(pilha, &topo);
    imprime_vetor(pilha);



    return 0;

}
