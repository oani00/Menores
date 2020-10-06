#include <stdio.h>
#include <iostream>
#include <new>
#include <string>
#include <stdlib.h>
#define TAM 10

using namespace std; //para utilizar o cout

int busca_simples(int vetor[TAM], int valorProcurado){

    //auxiliar contador
    bool valorFoiEncontrado;
    int cont;

 //PERCORRE a lista em busca do valor
    for(cont = 0; cont < TAM; cont++){
        if(vetor[cont] == valorProcurado){
            valorFoiEncontrado == true;
            posicaoEncontrada = cont;
        }
    }

    if(valorFoiEncontrado){
        return 1;
    }else{
        return -1;
    }

}


//func princ prog
int main(){

    int vetor[TAM] = {1,23,44,56,63,72,84,90,98};
    int valorProcurado;
    int posicao, posicaoEncontrada;



    //imprime o vetor
    for(cont = 0; cont < TAM; cont++){
        cout << vetor[cont] << " - ";
    }



    printf("qual n deseja encontrar?");
    scanf("%d", &valorProcurado);

    if (busca_simples(vetor, valorProcurado) == 1){
        cout << "o valor foi encontrado na posição:"
    }else{
        cout << "valor nao encontrado"
    }






    return 0;
}
