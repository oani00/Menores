#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>
#include <time.h>

using namespace std;

///area de definicao de cabecalhos
void menuInicial();

void limpaTela(){
    system("CLS");
}

void iniciaTabuleiro(char tabuleiro[3][3]){
    int linha, coluna;

    //Fazedo a matrizz
    for(linha = 0; linha < 3; linha++){
        for(coluna = 0; coluna< 3; coluna++){
            tabuleiro[linha][coluna] = '-';
        }
    }
}

void exibeTabuleiro (char tabuleiro[3][3]){
    int linha, coluna;

    cout << "\n";
    //MOSTRANDO a matriz
    for(linha = 0; linha < 3; linha++){
        for(coluna = 0; coluna< 3; coluna++){
            cout << tabuleiro[linha][coluna];
        }
        cout << "\n";
    }

}


//1 - x venceu, 2-0 venceu, 0 nada aconteceu
int confereTabuleiro(char tabuleiro[3][3]){

    int linha, coluna/

    //confere linhas
    for(linha = 0; linha < 3; linha++){
        if(tabuleiro[linha][0] == 'X' && tabuleiro[linha][0] == tabuleiro[linha][1] && tabuleiro[linha][1] == tabuleiro[linha][2]){

            return 1;
        }else if(tabuleiro[linha][0] == 'O' && tabuleiro[linha][0] == tabuleiro[linha][1] && tabuleiro[linha][1] == tabuleiro[linha][2]){

            return 2;
        }
    }

    //confere colunas
    for(coluna = 0; coluna < 3; coluna++){
        if(tabuleiro[0][coluna] == 'X' && tabuleiro[0][coluna] == tabuleiro[1][coluna] && tabuleiro[1][coluna] == tabuleiro[2][coluna]){

            return 1;
        }else if(tabuleiro[0][coluna] == 'O' && tabuleiro[0][coluna] == tabuleiro[1][coluna] && tabuleiro[1][coluna] == tabuleiro[2][coluna]){

            return 2;
        }
    }

    //diagonal principal
    if(tabuleiro[0][0] != '-' && tabuleiro[0][0] == tabuleiro[1][1] && tabuleiro[1][1] == tabuleiro[2][2]){
        if(tabuleiro[0][0] == 'X'){

            return 1;
        }else{

            return 2;
        }

    }

    //diagonal invertida
    if(tabuleiro[0][2] != '-' && tabuleiro[0][2] == tabuleiro[1][1] && tabuleiro[1][1] == tabuleiro[2][0]){
        if(tabuleiro[0][2] == 'X'){

            return 1;
        }else{

            return 2;
        }

    }

    return 0;

}

void jogo(){

    ///variaveis gerais
    string nomeDoJogadorUm, nomeDoJogadorDois, nomeDoJogadorAtual;
    char tabuleiro[3][3];                                                       //tabuleiro
    int linha, coluna;                                                          //tabuleir
    int linhaJogada, colunaJogada;
    int estadoDeJogo = 1;                                                           //0 sem jogo 1 em jogo
    int turnoDoJogador = 1;                                                     //1 X 2 O
    int rodada = 0;                                                                 //vezes que os jogadores jogaram no total
    int opcao;                                                                  //opcao de reinicio
    bool posicinouJogada;                                               //vrifica se foi feita a jogada

    //coloca os tracinhos no tabuleiro
    iniciaTabuleiro(tabuleiro);

    cout << "digite o nome do jogador 1"
    cin >> nomeDoJogadorUm;
    cout << "digite o nome do jogador 2"
    cin >> nomeDoJogadorDois;

    while(rodada < 9 && estadoDeJogo == 1){

    limpaTela();

    //exibe
    exibeTabuleiro(tabuleiro);

    cout << "\n Rodada:" << rodada << "\n";




    if(turnoDoJogador == 1){
        nomeDoJogadorAtual = nomeDoJogadorUm;
    }else{

        nomeDoJogadorAtual = nomeDoJogadorDois;

    }

    posicinouJogada = false;

    while(posicinouJogada == false) {

        cout << nomeDoJogadorAtual << "jogador, digite uma linha";
        cin >> linhaJogada;
        cout << nomeDoJogadorAtual << "jogador, digite uma coluna";
        cin >> colunaJogada;

    //verifica que a posicao e vazia
    if(tabuleiro[linhaJogada][colunaJogada] = '-'){

            posicinouJogada = true;

            if(turnoDoJogador == 1){
            tabuleiro[linhaJogada][colunaJogada] = 'X';
            turnoDoJogador = 2;
            }else{
                tabuleiro[linhaJogada][colunaJogada] = 'O';
                turnoDoJogador = 1;

            }

            if(confereTabuleiro(tabuleiro) == 1){
                cout << "O jogador X venceu";
                estadoDeJogo = 0
            }else if(confereTabuleiro(tabuleiro) == 2){
                cout << "O jogador O venceu";
                estadoDeJogo = 0
            }

    }

    }




     //aumenta uma rodada
     rodada++;


    }

    exibeTabuleiro(tabuleiro);
    cout << "fim de jogo";
    cout << "\n deseja reiniciar o jogo?";
    cout << "\n 1 - sim";
    cout << "\n 2 - nao";
    cin >> opcao;
    if(opcao == 1){
        menuInicial();
    }


}

void menuInicial(){

    //opcao escolhida
    int opcao = 0;

    while(opcao < 1 || opcao > 3){

        limpaTela();
        cout << "Bem vindo ao jogo da velha";
        cout << "\n 1 - Jogar";
        cout << "\n 2 - sobre";
        cout << "\n 3 - sair";
        cout << "\n escolha uma opcao e tecle ENTER";

        cin >> opcao;

        switch(opcao){
            case 1:
                //inicia o jogo
                //cout << "jogo iniciado";
                jogo();
                break;

            case 2:
                cout << "informacoes do jogo";
                break;

            case 3:
                cout << "ate mais";
                break;

        }

    }

}

int main(){
    menuInicial();
    return 0;
}
