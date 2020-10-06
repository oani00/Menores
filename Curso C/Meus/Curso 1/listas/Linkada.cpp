#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <new>
#include <string>
using namespace std;

struct pessoa{
    string nome;
    int rg;
    struct pessoa *proximo;
};

void limpaTela(){
    system("CLS");
}

int retornaTamanho(pessoa *ponteiroEncadeada){

    if(ponteiroEncadeada->nome == ""){
        return 0;
    }

    //tamnho da lista
    int tamanho = 0;

    //ponteiro cursor auxiliar
    pessoa *p = ponteiroEncadeada;

    while(p != NULL){
        //atualiza o cursor
        p = p->proximo;

        //contador de tamanho aumenta
        tamanho++;
    }
    return tamanho;

}

void imprimeEncadeada(pessoa *ponteiroEncadeada){

    //ponteiro cursor auxiliar
    pessoa *p = ponteiroEncadeada;

    while(p != NULL){
        cout << p->nome << "," << p->rg << "\n";

        //atualiza o cursor
        p = p->proximo;
    }
}

void adcComecoEncadeada(pessoa *&ponteiroEncadeada, string nome, int rg){

    //cria uma nova estrutura
    pessoa *novoValor = new pessoa;
    novoValor->nome = nome;
    novoValor->rg = rg;

    //verifica se a lista esta vazia
    if(ponteiroEncadeada->nome == ""){
        novoValor->proximo = NULL;
    }else{
        novoValor->proximo = ponteiroEncadeada;
    }

    //redireciona o ponteiro
    ponteiroEncadeada = novoValor;


}

void adcFimEncadeada(pessoa *&ponteiroEncadeada, string nome, int rg){

    //cria uma nova estrutura
    pessoa *novoValor = new pessoa;
    novoValor->nome = nome;
    novoValor->rg = rg;
    novoValor->proximo = NULL;

    //ponteiro cursor auxiliar
    pessoa *p = ponteiroEncadeada;

    //quando chega no ultimo elemento apontar para o novo valor
    if(p->proximo == NULL){
        p->proximo = novoValor;
        return;
    }

        //atualiza o cursor
        p = p->proximo;
    }

void adcPosicaoEncadeada(pessoa *&ponteiroEncadeada, string nome, int rg, int posicao){

     //cria uma nova estrutura
    pessoa *novoValor = new pessoa;
    novoValor->nome = nome;
    novoValor->rg = rg;
    novoValor->proximo = NULL;

    //ponteiro cursor auxiliar
    pessoa *p = ponteiroEncadeada;

    //contador de posicoes
    int cont = 0;

    while(cont <= posicao){

        //quando chega um antes da posicao desejada
        if(cont == posicao - 1){
            //auxiliar do valor
            pessoa *aux = new pessoa;

            //armazena o prox valor
            aux->proximo = p->proximo;

            //coloca o novo valor como o proximo de
            p->proximo = novoValor;

            //faz com que o novo valor aponte para o prox
            novoValor->proximo = aux->proximo;

            free(aux);
        }

        //atualiza o cursor
        p = p->proximo;
        cont++;
    }



}

void removeInicioEncadeada(pessoa *&ponteiroEncadeada){

    //se so existir um membro na lista
    if(ponteiroEncadeada->proximo == NULL){

            //cria uma nova estrutura
            pessoa *novoValor = new pessoa;
            novoValor->nome = "";
            novoValor->rg = 0;
            novoValor->proximo = NULL;

            ponteiroEncadeada = novoValor
    }else{
        //faz o ponteiro principal apontar para o prox valor
        ponteiroEncadeada = ponteiroEncadeada->proximo;
    }



}

void removeFimEncadeada(pessoa *&ponteiroEncadeada){

    //auxiliares
    pessoa *p = new pessoa;
    pessoa *aux = new pessoa;

    //ponteiro cursor auxiliar
    p = ponteiroEncadeada;

    //passa pela lista
    while(p->proximo != NULL){
        aux = p;
        p = p->proximo;
    }

    //muda o final da lista para o ultimo elemento
    aux->proximo = NULL;



}

int main(){

    //variaveis
    int funcaoDesejada = 1;

    //cria o inicio da lista encadeada
    pessoa *ponteiroEncadeada = new pessoa;
    ponteiroEncadeada->nome = "";
    ponteiroEncadeada->rg = 0;
    ponteiroEncadeada->proximo = NULL;

    //cria o primeiro valor
    pessoa *novoPrimeiroValor = new pessoa;
    novoPrimeiroValor->nome = "";
    novoPrimeiroValor->rg = 0;
    novoPrimeiroValor->proximo = NULL;

    //transforma o ponteiro do inicio da lista no novo valor

    ponteiroEncadeada = novoPrimeiroValor;

    while(funcaoDesejada < 9 && funcaoDesejada > 0) {

    //menu

    cout << "operacoes \n";
    cout << "1 - insercao de um node no início da lista\n";
    cout << "2 - insercao de um node no fim da lista\n";
    cout << "3 - insercao de um node na posicao n da lista\n";
    cout << "4 - retirada de um node no início da lista\n";
    cout << "5 - retirada de um node no fim da lista\n";
    cout << "6 - retirada de um node na posicao n da lista\n";
    cout << "7 - procura de um node com o campo RG \n";
    cout << "8 - imprimir a lista\n";
    cout << "9 - sair do sistema\n";
    cout << "\nEscolha um numero e pressione ENTER\n";
    cout << "\n\ntamanho atual:" << retornaTamanho(ponteiroEncadeada) << "\n";

    //imprime a lista
    if(retornaTamanho(ponteiroEncadeada) == 0){
        cout << "\n lista vazia";
    }else{
        imprimeEncadeada(ponteiroEncadeada);
    }

    //lendo o call do usuario
    cin >> funcaoDesejada;

    limpaTela();

    //variaveis para valores novos
    string nome;
    int rg, posicao;

    switch(funcaoDesejada){
        case 1:
            cout << "funcao escolhida 1 - insercao de um node no início da lista\n";

            //pedindo dados
            cout << "\n digite o nome: ";
            cin >> nome;
            cout << "\nDigite o RG:";
            cin >> rg;

            adcComecoEncadeada(ponteiroEncadeada, nome, rg);

            break;

        case 2:
            cout << "funcao escolhida 2 - insercao de um node no fim da lista\n";

            //pedindo dados
            cout << "\n digite o nome: ";
            cin >> nome;
            cout << "\nDigite o RG:";
            cin >> rg;

                if(retornaTamanho(ponteiroEncadeada) == 0){
                    adcComecoEncadeada(ponteiroEncadeada, nome, rg);
                    }else{
                        adcFimEncadeada(ponteiroEncadeada, nome, rg);
                    }
            break;

        case 3:
            cout << "funcao escolhida 3 - insercao de um node na posicao n da lista\n";

            //pedindo dados

            cout << "\nDigite a posicao:";
            cin >> posicao;
            cout << "\n digite o nome: ";
            cin >> nome;
            cout << "\nDigite o RG:";
            cin >> rg;


            if(posicao == 0){
                adcComecoEncadeada(ponteiroEncadeada, nome, rg);

            }else if(posicao == retornaTamanho(ponteiroEncadeada) - 1){
                adcFimEncadeada(ponteiroEncadeada, nome, rg);
            }else{
                adcPosicaoEncadeada(ponteiroEncadeada, nome, rg, posicao);
            }
            break;

            case 4:
            cout << "funcao escolhida 4 - retirada de um node no início da lista\n";

            removeInicioEncadeada(ponteiroEncadeada);

            break;

            case 5:
            cout << "funcao escolhida 5 - retirada de um node no fim da lista\n";

             if(retornaTamanho(ponteiroEncadeada) == 1){
                    removeInicioEncadeada(ponteiroEncadeada);
                    }else{
                        removeFimEncadeada(ponteiroEncadeada);
                    }



            break;
        }
    }


    return 0;
}
