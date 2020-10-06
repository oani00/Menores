#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

void main(){

    //definindo variaveis
    int a;
    float b;
    char c;
    bool d;

    //passando valores
    a = 5;
    b = 2.3;
    c = 'a';
    d = true;

    //escrevendo
    printf("\n O valor de a = %d", a);
    printf("\n O valor de b = %.2f", b);
    printf("\n O valor de c = %c\n", c);
    printf("\n O valor de d = %d\n", d);

    //lendo valores
    scanf("%d", &a);
    scanf("%f", &b);
    scanf(" %c", &c);
    scanf("%d", &d);

    //escrevendo
    printf("\n O valor de a = %d", a);
    printf("\n O valor de b = %.2f", b);
    printf("\n O valor de b = %c\n", c);


    //pausando
    system("pause");


}
