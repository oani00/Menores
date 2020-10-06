#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>

using namespace std;

//func princ prog
int main(){

    //variavel
    int a = 20;

    //imprimindo o valor de uma variavel
    printf("valor de a: %d \n", a);

    //imprimindo o ENDERECO de uma variavel
    printf("endereco de a: %d \n", &a);

    //VARIAVEIS ARMAZENAM VALORES
    int b = 10;

    //PONTEIROS ARMAZENAM POSICOES NA MEMORIA
    int *ponteiro;

    //ponteiro recebendo a posicao na memoria da variavel b
    ponteiro = &b;

    //imprimindo o valor de uma variavel
    printf("valor de b: %d \n", b);

    //* é CONTEUDO APONTADO POR
    *ponteiro = 40;

    //imprimindo o valor de uma variavel
    printf("valor de b: %d \n", b);


    //pausa
    system("pause");

    return 0;

}
