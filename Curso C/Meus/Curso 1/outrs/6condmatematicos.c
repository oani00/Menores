#include <stdio.h>
#include <stdlib.h>

void main(){

    //definindo variaveis
    int a = 5, b = 10, c = 15;

    //maior
    if(a > 2){
        printf("\n %d � maior que 2", a);
    }

    //maior ou igual
    if(c >= b){
        printf("\n %d � maior que %d", c,b);
    }

    //menor
    if(a < 10){
        printf("\n %d � menor que 10", a);
    }

    //menor ou igual
    if(a <= 10){
        printf("\n %d � menor ou igual a 10", a);
    }

    //diferente
    if(c != 10){
        printf("\n %d n�o � 10", c);
    }

    //pausa
    system("pause");

}
