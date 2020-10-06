#include <stdio.h>
#include <stdlib.h>
#include <time.h>





int main(){

    int randomNumber = 0;
    int guess = 0;
    int numberOfFuesses;
    time_t t;

    srand((unsigned) time(&t));

    randomNumber = rand() % 21;

    printf("\n this is a guessing game.");
    printf("\n i have chosen a nmber betwen 0 and 20, wich you must guess\n");

    for(numberOfFuesses = 5; numberOfFuesses > 0; --numberOfFuesses){
        printf("\n you have %d tr%s left.", numberOfFuesses, numberOfFuesses == 1 ? "y" : "ies");
        printf("\nenter a guess:");
        scanf("%d", &guess);

        if(guess == randomNumber){
            printf("\n congratualtions! You Guessed it\n");
            return;
        }else if(guess < 0 || guess > 20){
            printf("I said the number is betwen 0 and 20\n");
        }else if (randomNumber > guess){
            printf("Sorry, %d is wrong. My number is greater than that. \n", guess);
        }else (randomNumber < guess);{
            printf("Sorry, %d is wrong. My number is less than that. \n", guess);
        }
    }
    printf("\n You have had 5 tries and failes. The number was %d\n", randomNumber);


    return 0;
}
