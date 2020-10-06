#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>
#include <time.h>

using namespace std;

///cabecalhos de funcoes
void menuInicial();

void limpaTela(){
    system("CLS");
}

void iniciaTabuleiro(char tabuleiro[10][10], char mascara[10][10]){
    int linha, coluna;
    //popula o tabuleiro
    for(linha = 0; linha < 10, linha++;){
        for(linha = 0; linha < 10, linha++;){{
            tabuleiro[linha][coluna] = 'A';
            mascara[linha][coluna] = '*';
        }
    }
}

void exibeTabuleiro(char tabuleiro[10][10], char mascara[10][10]){

    char blue[] = {0x1b, '[', '1', ':', '3', '4', 'm', 0};
    char normal[] = {0x1b, '[', '1', ':', '3', '9', 'm', 0};
    char green[] = {0x1b, '[', '1', ':', '3', '2', 'm', 0};

    //colunas
    int cont;
    for(cont = 0; cont < 10; cont++){
        cout << cont << " ";
    }
    cout << "\n";

    //exibe o tabuleiro
    for(linha = 0; linha < 10, linha++){
            cout << linha << " - ";
        for(linha = 0; linha < 10, linha++){{

            switch(mascara[linha][coluna]){
                case 'A':
                    cout << blue << mascara[linha][coluna] << normal;
                    break;
                case 'p':
                    cout << green << mascara[linha][coluna] << normal;
                    break;
                default:
                    cout << normal << mascara[linha][coluna] << normal;
                    break;

            }
        }
        cout << "\n"
    }

    for(linha = 0; linha < 10, linha++){
        for(linha = 0; linha < 10, linha++){
        {
            cout << " " cout << tabuleiro[linha][coluna];
        }
        cout << "\n"
    }
}
    }
}

void posicionaBarcos(char tabuleiro[10][10]){

    //coloca 10 barcos no tabuleiro
    int cont, quantidade = 10, quantidadePosicionada = 0;

    while(quantidadePosicionada < quantidade){

        int linhaAleatoria = rand() % 10;
        int colunaAleatoria = rand() % 10;

        if(tabuleiro[linhaAleatoria][colunaAleatoria] == 'A'){

         //posiciona 10 barcos aleatoriamente
        tabuleiro[linhaAleatoria][colunaAleatoria] = 'p';

        quantidadePosicionada++;

        }



    }
}

void verificaTiro(char tabuleiro[10][10], int linhaJogada, int colunaJogada, int *pontos, string *mensagem){

    switch(tabuleiro[linhaJogada][colunaJogada]){
            case 'p':
                *pontos = *pontos + 10;
                *mensagem = "voce acertou um barco pequeno! (10 pts)";
                break;
            case 'A':
                *mensagem = "voce acertou a agua... (0 pts)"
                break;
        }


}


void jogo(string nomeDoJogador){

    ///variaveis gerais

    char tabuleiro[10][10], mascara[10][10];
    int linha, coluna;
    int linhaJogada, colunaJogada;
    int estadoDeJogo = 1;                                      //1 - jogo acontecendo 0 - fim de jogo
    int pontos = 0;
    int tentativas = 0, maximoDeTentativas = 5;
    int opcao
    string mensagem = "Bem vindo ao jogo";                     //mensagem de feedback


    //inicia o tabuleiro com agua
    iniciaTabuleiro(tabuleiro, mascara);

    //posiciona barcos aleatoriamente
    posicionaBarcos(tabuleiro);

    while(tentativas < maximoDeTentativas){

        limpaTela();

        //exibe
        exibeTabuleiro(tabuleiro, mascara);

        cout << "\npontos:" << pontos << ", tentativas restantes" << maximoDeTentativas - tentativas;
        cout << "\n" << mensagem;

        //verificaao de dados
        while((linhaJogada < 0 || colunaJogada < 0) || (linhaJogada > 9 || colunaJogada > 9)){

            cout << nomeDoJogador << "\ndigite uma linha";
            cin >> linhaJogada;
            cout << nomeDoJogador << "\ndigite uma coluna";
            cin >> colunaJogada;

        }




        //verifica o que aconteceu
        verificaTiro(tabuleiro, linhaJogada, colunaJogada, &pontos, &mensagem);

        //revela o que esta no tabuleiro
        mascara[linhaJogada][colunaJogada] = tabuleiro[linhaJogada][colunaJogada];

        tentativas++;
    }

    cout << "fim de jogo. o que deseja fazer?";
    cout << "\n 1- jogar novamente";
    cout << "\n 2- ir para o menu";
    cout << "\n 3- sair";
    cin >> opcao;

    switch(opcao){
        case 1:
            jogo(nomeDoJogador):
            break;
        case 2:
            menuInicial()
            break;

    }

}


void menuInicial(){

    //opcao escolhida pelo user
    int opcao = 0
    string nomeDoJogador;


    //enquando o jogarod nao digita uma opcao valiad mostra o menu
    while(opcao < 1 || opcao > 3){
        limpaTela();
        cout << "bem vindo ao jogo de batalha naval";
        cout << "\n 1- jogar";
        cout << "\n 2- sobre";
        cout << "\n 3- sair";
        cout << "\n escolha uma opcao e tecle ENTER";
        cin >> opcao;

        switch(opcao){

            case 1:

                cout << "qual seu nome?";
                cin >> nomeDoJogador
                //inicia o jogo
                //cout << "jogo iniciado"
                jogo(nomeDoJogador);
                break;

            case 2:
                cout << "info do jogo"
                break;

            case 3:
                cout << "ate mais"
                break;
        }
    }

}

int main(){

    srand((unsigned)time(NULL));

    menuInicial();
    return 0;
}
