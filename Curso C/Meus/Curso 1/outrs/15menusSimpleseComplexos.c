#include <stdio.h>
#include <stdlib.h>

//func princ prog
void main(){

    //def vars
    int opcao;

    while(opcao < 1 || opcao > 3){

    //interface de menu
    printf("escolha uma opcao");
    printf("\n1- opcao1");
    printf("\n1- opcao1");
    printf("\n1- opcao1");

    //lendo a opcao
    scanf("%d", &opcao);

    switch(opcao){
    case 1:
        printf("\nopcao 1 escolhida");
        break;
    case 2:
        printf("\nopcao 2 escolhida");
        break;
    case 3:
        printf("\nopcao 3 escolhida");
        break;
    default:
        printf("\nopcao invalida");
        break;


    }
    }
    //pausa
    system("pause");


}
