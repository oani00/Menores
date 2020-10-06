package com.company;

public class Main {

    public static void main(String[] args) {

        System.out.println(sumOdd(-13, 13));


    }

    public static boolean isOdd (int number){
        if(number <= 0){
            return false;
        }else if(number % 2 != 0){
            return true;
        }else {
            return false;
        }
    }



    public static int sumOdd (int start, int end){

        int sum = 0;

        if (start > 0 && end >= start){
            for(start = start; start <= end; start++){
                if(isOdd(start) == true){
                    sum += start;
                }
            }
            return sum;
        }else{
            return -1;
        }

    }




}
