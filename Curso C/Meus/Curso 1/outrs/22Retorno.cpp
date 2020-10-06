#include <stdio.h>
#include <stdlib.h>

//funcao que retorna 10
int retornaDez(){
    printf("oi vei");
    return 10;
}

float retornaquebrado();

//func princ prog
int main(){

    //vars
    int a;

    //passando o retorno de uma funcao para uma var
    a = retornaDez();

    //imprimindo o valor de a
    printf("%d", a);

    //definindo um float
    float b;

    //passando o reotrno de uma função para b
    b = retornaquebrado();

    //imprimindo o valor de b
    printf("%f", b);

    //pausa
    system("pause");

    return 0;

}


//retorna um n quebrado
float retornaquebrado(){
    return 5.5;
}
