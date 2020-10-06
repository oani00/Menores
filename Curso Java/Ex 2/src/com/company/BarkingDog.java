package com.company;

public class BarkingDog {
    public static boolean shouldWakeUp(boolean barking, int hourOfDay){
        if(hourOfDay < 8 && hourOfDay >= 0 && barking == true){
            return true;
        }else if(hourOfDay <= 23 && hourOfDay >= 22 && barking == true){
            return true;
        }else{
            return false;
        }
    }
}