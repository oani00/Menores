#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>
#include <new>

using namespace std;

//struct para frutas
struct fruta{
    string cor;
    string nome;
};

//func princ prog
int main(){

    //criando um ponteiro para o struct
    fruta *primeiraFruta = new fruta;

    //modificando valroes
    primeiraFruta->cor = "amarela";
    primeiraFruta->nome = "Banana";

    //exibindo
    cout << "fruta:" << primeiraFruta->nome << ", cor: " << primeiraFruta->cor;

    //criando uma lista de frutas
    fruta *ponteiroListaDeFrutas = new fruta[2];

    //modificando valroes
    ponteiroListaDeFrutas[0].cor = "vermelho";
    ponteiroListaDeFrutas[0].nome = "morango";
    ponteiroListaDeFrutas[1].cor = "verde";
    ponteiroListaDeFrutas[1].nome = "kiwi";

    //percorrendo e exibindo
    int cont;
    for(cont = 0; cont < 2; cont++){
        cout << "fruta:" << ponteiroListaDeFrutas[cont].nome << ", cor" << ponteiroListaDeFrutas[cont].cor;
    }

    return 0;

}
