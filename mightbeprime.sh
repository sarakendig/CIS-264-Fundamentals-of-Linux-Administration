#!/bin/bash
#Author: Sara Kendig
#date: 3/7/23
#purpose: a script to guess if the user input number might be one of the first 10 prime numbers (2 3 5 7 11 13 17 19 23 29 31)

#first 10 prime numbers
primes=(2 3 5 7 11 13 17 19 23 29 31)


#function that checks if user input is a prime number

prime_checker() {
        echo "Enter a number: "
        read num
        isprime=true
        #check if it is a prime number
        for primenum in "${primes[@]}"; do
                if (( num == primenum )); then
                        echo "$num is a prime number."
                        return
                elif (( num % primenum == 0 )); then
                        echo "$num is not a prime number, it's divisible by $primenum"
                        isprime=false
                fi
        done
        if [[ $isprime == true ]]; then
                echo "$num might be prime"
        fi
}

#loop to keep game going
keepgoing=true
while [[ $keepgoing == true ]]; do
        prime_checker
        echo "Do you want to keep playing? (y/n) "
        read answer
        if [[ $answer == "y" ]]; then
                keepgoing=true
        else
                keepgoing=false
        fi
done
