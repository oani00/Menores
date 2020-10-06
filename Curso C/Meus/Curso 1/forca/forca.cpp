#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>
#include <time.h>

using namespace std; //para utilizar o cout

void limpaTela(){
    system("CLS");
}

string retornaPalavraAleatoria(){

    //Vetor com palavars disponiveis
    string palavras[3] = ("Abacaxi", "Manga", "Morango");

    //incide gerao no intervalo 0 1 2
    int indiceAleatorio = rand() % 3;

    //escreve a  palavra
    //cout << palavras[indiceAleatorio];

    return palavras[indiceAleatorio];

}

string retornaPalavraComMascara(string palavra, int tamanhoDaPalavra){

    int cont = 0;
    string palavraComMascara;

    while(cont < tamanhoDaPalavra){
        palavraComMascara += "_";
        cont++;
    }

    return palavraComMascara;


}

void exibeStatus(string palavraComMascara, int tamanhoDaPalavra, int tentativasRestantes, string letrasJaArriscadas, mensagem){

    cout << mensagem;
    cout << "\n Palavra:" << palavra << "tamanho:" << tamanhoDaPalavra;
    cout << "\n Tentativas Restantes:" << tentativasRestantes;


    //exibe as letras arriscadas
    int cont;
    cout << "\n letras arriscadas:"
    for(cont = 0; cont < letrasJaArriscadas.size(); cont++){

        cout << letrasJaArriscadas[cont] << ", ";

    }


}


int jogarSozinho(){



    //palavra a ser adivinhada
    string palavra = retornaPalavraAleatoria();

    //tamanho da palavra
    int tamanhoDaPalavra = palavra.size();

    //palavra mascarada
    string palavraComMascara = retornaPalavraComMascara(palavra, tamanhoDaPalavra);

    ///Variaveis Gerais
    int tentativas = 0, maximoDeTentativas = 10;         //numero de tentativas e erros
    int cont = 0;                                       //auxiliar para lacos de repeticao
    char letra;                                         //letra arriscada
    int opcao;
    string letrasJaArriscadas;                          //acumula as tentativas do jogador
    string mensagem = "Bem vindo ao jogo";              //feedback do jogador
    bool jaDigitouLetra = false, acertouLetra = false;  //auxiliar p saber se a letra ja foi digitata


    while(palavra != palavraComMascara && maximoDeTentativas - tentativas > 0){

        limpaTela();

        exibeStatus(palavraComMascara, tamanhoDaPalavra, maximoDeTentativas - tentativas, letrasJaArriscadas, mensagem);


        cout << "digite uma letra:";
        cin >> letra;


        //percorre as letas ja arriscadas
        for(cont = 0; cont < tentativas; cont++){

            //se encontrar a letar
            if(letrasJaArriscadas[cont] == letra){

                mensagem = "essa letra ja foi digitada"



            }

        }

        if(jaDigitouLetra == false){

            letrasJaArriscadas += tolower(letra);

            //percorre a palavra e se a lietra existir muda a palavra com mascara
            for(cont = 0; cont < tamanhoDaPalavra; cont++){
                if(palavra[cont] == tolower(letra)){

                    //se a letra existir  na palavra escondida

                    palavraComMascara[cont] = palavra[cont]

                    acertouLetra = true;
                }
            }
            tentativas++;
            if(acertouLetra == false){
            mensagem = "voce errou a letra!";
        }else{
            mensagem = "voce acerto uma letra";
            }
        }
        jaDigitouLetra = false;
        acertouLetra = false;
    }

    if(palavra == palavraComMascara){

        limpaTela();
        cout << "parabens vc venceu!";
        cout << "\n deseja reiniciar?";
        cout << "\n 1-sim";
        cout << "\n 2-nao";
        cin >> opcao;
        return opcao;

    }else{

        limpaTela()
        cout << "vish vc perdeu!!!";
        cout << "\n deseja reiniciar?";
        cout << "\n 1-sim";
        cout << "\n 2-nao";
        cin >> opcao;
        return opcao;

    }

}


void menuInicial(){

    //opcao escolhida
    int opcao = 0;

    while(opcao < 1 || opcao > 3){
        limpaTela();
        cout << "bem vindo ao jogo";
        cout << "\n jogar";
        cout << "\n sobre";
        cout << "\n sair";
        cout << "\n escolha uma opção e tecle ENTER:";

        cin >> opcao;

        switch(opcao){
        case 1:
            //inici ao jogo
            if(jogarSozinho() == 1){

                menuInicial();

            }

            break;

        case 2:
            //info do jogo
            cout << "informacoes do jogo";
            limpaTela();
            cout << "INFO VEM AQUI"
            cout << "\n voltar"
            cout << "\n sair"
            cin >> opcao;
            if(opcao == 1){
                menuInicial();

            }

            break;

        case 3:
            cout << "até mais!";


            break;
        }

    }



}


//func princ prog
int main(){

    //para gerar numeros aleatorios
    srand((unsigned)time(NULL));


    menuInicial();



    return 0;
}
