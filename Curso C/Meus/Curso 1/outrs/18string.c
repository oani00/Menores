#include <stdio.h>
#include <stdlib.h>


//func princ prog
void main(){

    //variaveis
    char palavra[255];

    //instrucao
    printf("digite uma palavra");

    //limpa o buffer
    setbuf(stdin, 0);

    //le a string
    fgets(palavra, 255, stdin);

    //limpa as casas nao utilizadas
    palavra[strlen(palavra)-1] = '\0';

    //imprime na tela
    printf("%s", palavra);

    //pausa
    system("pause");


}
