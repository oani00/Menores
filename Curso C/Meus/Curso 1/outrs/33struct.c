#include <stdio.h>
#include <stdlib.h>

struct palavra{
    int ordem;
    char letra;
    char texto[255];
};


int main(){

    //criar uma palavra
    struct palavra primeiraPalavra;

    //midificando campos
    primeiraPalavra.ordem = 0;
    primeiraPalavra.letra = 'c';
    strcpy(primeiraPalavra.texto, "palavrinha")

    //mostrando valores do struct
    printf("ordem: %d, primeira letra: %c, palavra: %s", primeiraPalavra.ordem, primeiraPalavra.letra, primeiraPalavra.texto);

    //fazendo uma lista de structs
    struct palavra listaDePalavras[3];

    //midificando campos
    listaDePalavras[0].ordem = 0;
    listaDePalavras[1].ordem = 0;
    listaDePalavras[2].ordem = 0;
    listaDePalavras[3].ordem = 0;
    listaDePalavras[3].ordem = 0;
    listaDePalavras[3].ordem = 0;



    return 0;

}
