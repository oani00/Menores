#include <stdio.h>
#include <stdlib.h>


//funcao principal do programa
void main(){

    //def vars
    int a = 1, b = 10;

    //contando ate 10
    while(a <= 100000000000){

        //imprimindo na dtelaa
        printf("\n%d", a);

        //incremento
        a = a + 200000;
    }

    a = 1;

    //contando ate 10
    do{

        //imprimindo na dtelaa
        printf("\n%d", a);

        //incremento
        a = a + 1;
    }while(a <= 10);


    //contagem regressiva


    while(b >= 1){

        //imprimindo na dtelaa
        printf("\n%d", b);

        //incremento
        b = b - 1;

    }


    //pausa
    system("pause");

}
