#include <iostream>
#include <new>
#include <string>
#include <stdlib.h>

using namespace std;

struct pessoa{
    string nome;
    int rg;

};

void limpatela(){
    system("CLS");
}

void imprimeSequencial(pessoa *ponteiroSequencial, int tamanhodaLista){

    int cont;
    for(cont = 0; cont < tamanhodaLista; cont++){
        cout << cont << " - " << ponteiroSequencial[cont].nome << "," << ponteiroSequencial[cont].rg << "\n";
    }

}

void adcComecoSequencial(pessoa *&ponteiroSequencial, int *tamanhoDaLista, string nome, int rg){

    //se a lista for vazia, cria uma
    if(*tamanhoDaLista == 0){

        pessoa *novaListaSequencial = new pessoa[1];

        novaListaSequencial[0].nome = nome;
        novaListaSequencial[0].rg = rg;

        //atualiza o ponteiro p lista nova
        ponteiroSequencial = novaListaSequencial;


    }else{

        //caso a lista ja tenha membros
        pessoa *novaListaSequencial = new pessoa[*tamanhoDaLista + 1];


        novaListaSequencial[0].nome = nome;
        novaListaSequencial[0].rg = rg;

        //passa os elementos do vetor antigo para o nomvo
        int cont;
        for(cont = 0; cont < *tamanhoDaLista; cont ++){
            novaListaSequencial[cont + 1].nome = ponteiroSequencial[cont].nome;
            novaListaSequencial[cont + 1].rg = ponteiroSequencial[cont].rg;
        }

        //atualiza o ponteiro p lista nova
        ponteiroSequencial = novaListaSequencial;


    }

    //aumenta o tamanho da lista
    *tamanhoDaLista = *tamanhoDaLista + 1;

}

void adcFimSequencial(pessoa *&ponteiroSequencial, int *tamanhoDaLista, string nome, int rg){

    //cria uma lista com um numero maior
    pessoa *novaListaSequencial = new pessoa[*tamanhoDaLista + 1];

    //passa os elementos do vetor antigo para o novo
    int cont;
    for(cont = 0; cont < *tamanhoDaLista; cont ++){
            novaListaSequencial[cont].nome = ponteiroSequencial[cont].nome;
            novaListaSequencial[cont].rg = ponteiroSequencial[cont].rg;
    }

    //posiciona o ultimo elemento
    novaListaSequencial[*tamanhoDaLista].nome = nome;
    novaListaSequencial[*tamanhoDaLista].rg = rg;

    //atualiza o ponteiro p lista nova
    ponteiroSequencial = novaListaSequencial;

    //aumenta o tamanho da lista
    *tamanhoDaLista = *tamanhoDaLista + 1;


}

void adcPosicaoSequencial(pessoa *&ponteiroSequencial, int *tamanhoDaLista, string nome, int rg, int posicao){

    //cria uma lista com um numero maior
    pessoa *novaListaSequencial = new pessoa[*tamanhoDaLista + 1];

    //passa os elementos do vetor antigo para o novo
    int cont;
    for(cont = 0; cont < posicao; cont ++){
            novaListaSequencial[cont].nome = ponteiroSequencial[cont].nome;
            novaListaSequencial[cont].rg = ponteiroSequencial[cont].rg;
    }

    //adiciona o novo registro na posicao correta
    novaListaSequencial[posicao].nome = nome;
    novaListaSequencial[posicao].rg = rg;

    //coloca o resto dos valores antigos
    for(cont = posicao + 1; cont < *tamanhoDaLista + 1; cont ++){
            novaListaSequencial[cont].nome = ponteiroSequencial[cont - 1].nome;
            novaListaSequencial[cont].rg = ponteiroSequencial[cont - 1].rg;
    }

     //atualiza o ponteiro p lista nova
    ponteiroSequencial = novaListaSequencial;

    //aumenta o tamanho da lista
    *tamanhoDaLista = *tamanhoDaLista + 1;


}

void removeInicioSequencial(pessoa *&ponteiroSequencial, int *tamanhoDaLista){

    //cria um vetor com uma posicao a menos
    pessoa *novaListaSequencial = new pessoa[*tamanhoDaLista - 1];

    //passa os elementos do vetor antigo para o novo
    int cont;
    for(cont = 1; cont < *tamanhoDaLista; cont ++){
            novaListaSequencial[cont-1].nome = ponteiroSequencial[cont].nome;
            novaListaSequencial[cont-1].rg = ponteiroSequencial[cont].rg;
    }


    //atualiza o ponteiro p lista nova
    ponteiroSequencial = novaListaSequencial;

    //reduzo o tamanho da lista
    *tamanhoDaLista = *tamanhoDaLista - 1;


}

void removeFimSequencial(pessoa *&ponteiroSequencial, int *tamanhoDaLista){

    //cria um vetor com uma posicao a menos
    pessoa *novaListaSequencial = new pessoa[*tamanhoDaLista - 1];

    //passa os elementos do vetor antigo para o novo MENO O ULTIMO
    int cont;
    for(cont = 0; cont < *tamanhoDaLista - 1; cont ++){
            novaListaSequencial[cont].nome = ponteiroSequencial[cont].nome;
            novaListaSequencial[cont].rg = ponteiroSequencial[cont].rg;
    }

     //atualiza o ponteiro p lista nova
    ponteiroSequencial = novaListaSequencial;

    //reduzo o tamanho da lista
    *tamanhoDaLista = *tamanhoDaLista - 1;


}

void removePosicaoSequencial(pessoa *&ponteiroSequencial, int *tamanhoDaLista, int posicao){

    //cria um vetor com uma posicao a menos
    pessoa *novaListaSequencial = new pessoa[*tamanhoDaLista - 1];

    //passa os valores de acordo com o contador
    int cont;
    for(cont = 0; cont < *tamanhoDaLista - 1; cont++){

        if(cont < posicao){

            //se estiver antes da posicao passa normalmente
            novaListaSequencial[cont].nome = ponteiroSequencial[cont].nome;
            novaListaSequencial[cont].rg = ponteiroSequencial[cont].rg;

        }else{

            //se estiver antes da posicao passa normalmente
            novaListaSequencial[cont].nome = ponteiroSequencial[cont + 1].nome;
            novaListaSequencial[cont].rg = ponteiroSequencial[cont + 1].rg;


        }

    }

     //atualiza o ponteiro p lista nova
    ponteiroSequencial = novaListaSequencial;

    //reduzo o tamanho da lista
    *tamanhoDaLista = *tamanhoDaLista - 1;


}

string retornaNomeSequencial(pessoa *&ponteiroSequencial, int *tamanhoDaLista, int rg){

    string nome = "Nao encontrado";

    //busca pelo nome com o rg digitado
    int cont;
    for(cont = 0; cont < *tamanhoDaLista; cont++){

        if(ponteiroSequencial[cont].rg == rg){
            nome = ponteiroSequencial[cont].nome;
        }

    }

    return nome;



}



int main(){

    int funcaoDesejada = 1;

    //ponteiro para lista sequencia
    pessoa *ponteiroSequencial;

    //tamanho da lista
    int tamanhoDaLista = 0;

    //exemplo
    /*pessoa * exemploListaSequencial = new pessoa[1];

    exemploListaSequencial[0].nome = "John";
    exemploListaSequencial[0].rg = 123;
    exemploListaSequencial[1].nome = "Maicon";
    exemploListaSequencial[1].rg = 321;

    //faz o ponteiro principal apontar para o novo vetor
    ponteiroSequencial = exemploListaSequencial;*/




    while(funcaoDesejada < 10 && funcaoDesejada > 0){

        imprimeSequencial(ponteiroSequencial, tamanhoDaLista);

        cout << "operacoes \n";
        cout << "1 - Insercao de um node no inicio da lista \n";
        cout << "2 - Insercao de um node no fim da lista \n";
        cout << "3 - Insercao de um node na posicao N \n";
        cout << "4 - Retirar um node do inicio da lista \n";
        cout << "5 - Retirar um node no fim da lista \n";
        cout << "6 - Retirar um node na posicao N \n";
        cout << "7 - Procurar um node com o campo RG \n";
        cout << "8 - Imprimir a Lista. \n";
        cout << "9 - Sair do sistema. \n";
        cout << "\nEscolha um numero e pressione ENTER: \n";

        cin >> funcaoDesejada;

        limpatela();

        //variaveis usadas nas operacoes
        string nome;
        int rg, posicao;

        switch(funcaoDesejada){
            case 1:
                cout << "função escolhida: 1 - Insercao de um node no inicio da lista \n";

                cout << "digite um nome:";
                cin >> nome;
                cout << "digite um rg";
                cin >> rg;

                adcComecoSequencial(ponteiroSequencial, &tamanhoDaLista, nome, rg);

                break;

            case 2:

                cout << "função escolhida: 2 - Insercao de um node no fim da lista \n";

                cout << "digite um nome:";
                cin >> nome;
                cout << "digite um rg";
                cin >> rg;

                //se a lista for vaziz
                if(tamanhoDaLista == 0){
                    adcComecoSequencial(ponteiroSequencial, &tamanhoDaLista, nome, rg);
                }else{
                    adcFimSequencial(ponteiroSequencial, &tamanhoDaLista, nome, rg);
                }

                break;

            case 3:

                cout << "função escolhida: 3 - Insercao de um node na posicao N \n";

                cout << "digite uma posicao"
                cin >> posicao;
                cout << "digite um nome:";
                cin >> nome;
                cout << "digite um rg";
                cin >> rg;



                if(posicao == 0){
                    //se estiver adicionando no começo
                    adcComecoSequencial(ponteiroSequencial, &tamanhoDaLista, nome, rg);
                }else if(posicao == tamanhoDaLista){
                    //quando quer adicionar no fim
                    adcFimSequencial(ponteiroSequencial, &tamanhoDaLista, nome, rg);
                }else{
                    adcPosicaoSequencial(ponteiroSequencial, &tamanhoDaLista, nome, rg, posicao);
                }

                break;

            case 4:

                cout << "Funcao escolhida : 4 - Retirar um node do inicio da lista \n";

                //se a lista for vazia
                if(tamanhoDaLista == 0){
                    cout << "\n lista vazia\n"
                }else{
                    removeInicioSequencial(ponteiroSequencial, &tamanhoDaLista);
                }

                break;

            case 5:

                cout << "Funcao escolhida : 5 - Retirar um node do fim da lista \n";

                //se a lista for vazia
                if(tamanhoDaLista == 0){
                    cout << "\n lista vazia\n"
                }else{
                    removeFimSequencial(ponteiroSequencial, &tamanhoDaLista);
                }

                break;

            case 6:

                cout << "Funcao escolhida : 6 - Retirar um node na posicao N \n";

                //se a lista for vazia
                if(tamanhoDaLista == 0){
                    cout << "\n lista vazia\n"
                }else{

                    cout << "digite uma posicao";
                    cin >> posicao;

                    if(posicao == 0){
                        removeInicioSequencial(ponteiroSequencial, &tamanhoDaLista);
                    }else if(posicao == tamanhoDaLista - 1) {
                        removeFimSequencial(ponteiroSequencial, &tamanhoDaLista);
                    }else{
                        removePosicaoSequencial(ponteiroSequencial, &tamanhoDaLista, posicao);
                    }
                }
                break;



                case 7:

                cout << "Funcao escolhida : 7 - Procurar um node com o campo RG \n"";

                //se a lista for vazia
                if(tamanhoDaLista == 0){
                    cout << "\n lista vazia\n"
                }else{

                    cout << "digite um rg";
                    cin >> rg;

                    cout << "nome:" << retornaNomeSequencial(ponteiroSequencial, &tamanhoDaLista, rg);


                }
                break;


    }

    }



    return 0;

}
