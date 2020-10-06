#include <stdio.h>
#include <stdlib.h>

//funcao principal do programa
void main(){

    //definindo variaveis
    int a = 6, b = 4;

    //soma
    printf("\n a soma de %d e %d = %d",a,b, a + b);

    //sub
    printf("\n a subrcao de %d e %d = %d",a,b, a - b);

    //div
    printf("\n a div de %d e %d = %d",a,b, a / b);

    //multiplicaocao
    printf("\n a mult de %d e %d = %d",a,b, a * b);

    //resto da div
    printf("\n o resto da div entre %d e %d = %d",a,b, a % b);

    //valor absoluto
    printf("\n o valor absoluto de -3 = %d", abs(-3));

    //imprimir na tela
    printf("\noi mundo");

    //pausar
    system("pause");


}
