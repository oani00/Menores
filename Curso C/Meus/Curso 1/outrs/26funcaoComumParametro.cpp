#include <stdio.h>
#include <stdlib.h>

void mostraSucessor(int numero){
    printf("o sucessor de %d eh %d", numero, numero + 1);
}

int retornaAntecessor (int numero){
    return numero - 1;
}

//func princ prog
int main(){

    //definindo vars
    int a;

    //instrucao
    printf("digite um valor");

    //passa um valor para a
    scanf("%d", &a);

    //chama a funcao
    mostraSucessor(a);

    //exibe o antecessor
    printf("\n o antecessor de %d eh %d", a, retornaAntecessor(a));




    return 0;

}
