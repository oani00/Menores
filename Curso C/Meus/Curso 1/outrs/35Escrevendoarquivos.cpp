#include <stdio.h>
#include <stdlib.h>
#include <fstream>
#include <string>
#include <iostream>

using namespace std;


//func princ prog
int main(){

    //cursor que ira percorrer as letras
    int c;

    //arquivo a ser ldo
    FILE *file;

    //abre o arquivo no diretorio escolhido
    file = fopen("Texto.txt", "r");

    //se o arquivo foi encontrado
    if(file){

        //enquanto encontra letras
        while((c = getc(file)) != EOF){

            //imprime na tela
            printf("%c", c);
        }

        //fechando
        fclose(file);

    }


    return 0;

}
