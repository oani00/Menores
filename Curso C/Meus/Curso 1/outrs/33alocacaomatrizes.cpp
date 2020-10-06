#include <stdio.h>
#include <stdlib.h>

//func princ prog
int main(){

    //def vars
    int linhas = 3, colunas = 3, i, j;
    int **matriz;

    printf("digite o n de linhas");
    scanf("%d", &linhas);
    printf("\ndigite o n de colunas");
    scanf("%d", &colunas);

    //alocando as linhas
    matriz = (int **) malloc(linhas * sizeof(int *));

    //alocando memoria para as colunas de cada linha
    for(i = 0; i < linhas; i++){
        matriz[i] = (int *) malloc(colunas * sizeof(int));
    }

    //preenchendo valors e exibindo a matriz
    for(i = 0; i < linhas; i++){
        for(j = 0; j < colunas; j++){
            matriz[i][j] = i;
            printf("%d ", matriz[i][j]);
        }
        printf("\n");
    }

    //libera a memoria
    free(matriz);

    return 0;

}
