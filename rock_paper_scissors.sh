#!/bin/bash

# Function to get computer's choice
get_computer_choice() {
    choices=("rock" "paper" "scissors")
    echo "${choices[$(( RANDOM % 3 ))]}"
}

# Function to determine the winner
determine_winner() {
    if [ "$1" == "$2" ]; then
        echo "It's a tie!"
    elif [[ ( "$1" == "rock" && "$2" == "scissors" ) || ( "$1" == "paper" && "$2" == "rock" ) || ( "$1" == "scissors" && "$2" == "paper" ) ]]; then
        echo "You win!"
    else
        echo "Computer wins!"
    fi
}

# Main game loop
while true; do
    echo "Choose rock, paper, or scissors (or type 'exit' to quit):"
    read -r user_choice

    if [ "$user_choice" == "exit" ]; then
        echo "Thanks for playing!"
        break
    fi

    if [[ "$user_choice" != "rock" && "$user_choice" != "paper" && "$user_choice" != "scissors" ]]; then
        echo "Invalid choice, try again."
        continue
    fi

    computer_choice=$(get_computer_choice)
    echo "Computer chose: $computer_choice"

    determine_winner "$user_choice" "$computer_choice"
done
