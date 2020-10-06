#include <stdio.h>
#include <stdlib.h>

//funcao principal do programa
void main(){


    //Def vars
    int a = 1;
    char b = 'x';


    if(a == 1){
        printf("\n opcao escohida foi a 1")
    }else if(a == 2){
        printf("\n opcao escohida foi a 2")
    }else if (a == 3){
        printf("\n opcao escohida foi a 3")
    }else {
        printf("\n opcao invalida")
    }


    switch(a){
        case 1:
            printf("\n opcao escohida foi a 1")
            break;
        case 2:
            printf("\n opcao escohida foi a 2")
            break;
        case 3:
            printf("\n opcao escohida foi a 3")
            break;
        default:
            printf("\n opcao invalida")
            break;

    }


    //pausa
    system("pause");


}
