#include <stdio.h>
#include <stdlib.h>

void main(){

    //definindo variaveis
    int a = 4,opcao = 1;

    //condicional simples
    if(a == 5){
        printf("a var a = 5");
    }

    //n par ou impar

    if(a % 2 == 1){
        printf("\n a var A � IMPAR");
    }else{
        printf("\n a var � PAR");
    }

    //condicional composta
    if(opcao == 1){
        printf("\n a opcao = 1");
    }else if(opcao == 2){
        printf("\n a opcao = 2");
    }else{
        printf("\n a opcao nao � nem 1 nem 2");
    }

    //pausa
    system("pause");


}
