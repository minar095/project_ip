#!/bin/bash

# Array of words
WORDS=("bash" "script" "linux" "terminal" "command" "unix" "shell")

# Choose a random word from the array
WORD=${WORDS[$RANDOM % ${#WORDS[@]}]}
WORD_LENGTH=${#WORD}
GUESSES=()
TRIES=6

# Initialize the guessed word with underscores
GUESSED_WORD=$(printf "_%.0s" $(seq 1 $WORD_LENGTH))

# Function to display the current state of the game
display_game() {
    echo "Word: $GUESSED_WORD"
    echo "Guesses: ${GUESSES[@]}"
    echo "Tries left: $TRIES"
}

# Main game loop
while [ "$GUESSED_WORD" != "$WORD" ] && [ $TRIES -gt 0 ]; do
    display_game
    echo -n "Guess a letter: "
    read -n 1 GUESS
    echo

    if [[ "$WORD" == *"$GUESS"* ]]; then
        # Correct guess, update the guessed word
        for (( i=0; i<$WORD_LENGTH; i++ )); do
            if [ "${WORD:$i:1}" == "$GUESS" ]; then
                GUESSED_WORD="${GUESSED_WORD:0:$i}$GUESS${GUESSED_WORD:$i+1}"
            fi
        done
    else
        # Incorrect guess, decrement tries
        ((TRIES--))
    fi

    # Add guess to guesses array
    GUESSES+=($GUESS)
done

# Game over message
if [ "$GUESSED_WORD" == "$WORD" ]; then
    echo "Congratulations! You guessed the word: $WORD"
else
    echo "Game over! The word was: $WORD"
fi
