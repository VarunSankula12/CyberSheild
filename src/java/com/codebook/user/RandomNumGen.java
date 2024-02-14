package com.codebook.user;


import java.util.Random;

public class RandomNumGen {
    
    public static String generateNumber() {
        String prefix = "2024"; 
        int randomNumberLength = 8; 

        Random random = new Random();
        int randomNumber = random.nextInt((int) Math.pow(10, randomNumberLength));

        String formattedRandomNumber = String.format("%0" + randomNumberLength + "d", randomNumber);

        String applicationNumber = prefix + formattedRandomNumber;

        return applicationNumber;
    }
    
    
}

