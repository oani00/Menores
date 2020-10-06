#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>

using namespace std;

//func princ prog
int main(){

    //criando uma matriz
    int matriz[2][2], i, j;

    //passando valores
    matriz[0][0] = 1;
    matriz[0][1] = 2;
    matriz[1][0] = 3;
    matriz[1][1] = 4;


    //imprimindo na tela
    for(i = 0; i < 2; i++){
        for(j = 0; j < 2; j++){
            //cout << "i = " << i << " , j = " << j;
            cout << matriz[i][j] << " ";
        }
        cout << "\n";
    }

    //lendo valores
    for(i = 0; i < 2; i++){
        for(j = 0; j < 2; j++){
            //scanf("%d", &matriz[i][j]);
            cin >> matriz[i][j];
        }

    }


    //imprimindo na tela
    for(i = 0; i < 2; i++){
        for(j = 0; j < 2; j++){
            //cout << "i = " << i << " , j = " << j;
            cout << matriz[i][j] << " ";
        }
        cout << "\n";
    }


    //pausa
    system("pause");

    return 0;

}
