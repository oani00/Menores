#include <stdio.h>
#include <stdlib.h>


//funcao principal do programa
void main(){

    //definindo variaveis
    int a = 0;

    //contando ate um monte
    while(a <= 68719476736){

        //imprimindo na tela
        printf("\n%d", a);

        //incremento
        a = a + 10000;
    }


    //pausa
    system("pause");

}
