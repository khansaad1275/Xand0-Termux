#!/bin/bash
# Simple X and O game For Termux

# Initialize game board
board=(. . . . . . . . .)

# Defining function to print the board
function print_board {
    echo ""
    echo " ${board[0]} | ${board[1]} | ${board[2]} "
    echo "---+---+---"
    echo " ${board[3]} | ${board[4]} | ${board[5]} "
    echo "---+---+---"
    echo " ${board[6]} | ${board[7]} | ${board[8]} "
    echo ""
}

# Defining function to check for a win
function check_win {
    if [[ ${board[$1]} == $2 && ${board[$3]} == $2 && ${board[$5]} == $2 ]]; then
        echo "Player $2 wins!"
        exit
    fi
}

# Defining function to check for a draw
function check_draw {
    for space in ${board[@]}; do
        if [[ $space == "." ]]; then
            return
        fi
    done
    echo "The game is a draw."
    exit
}

# Loop until a player wins or the game is a draw
while true; do
    # Player X turn
    print_board
    echo "Player X, choose a space (1-9):"
    read x_choice
    if [[ ${board[$x_choice-1]} == "." ]]; then
        board[$x_choice-1]="X"
        check_win 0 "X" 1 "X" 2 "X"
        check_win 3 "X" 4 "X" 5 "X"
        check_win 6 "X" 7 "X" 8 "X"
        check_win 0 "X" 3 "X" 6 "X"
        check_win 1 "X" 4 "X" 7 "X"
        check_win 2 "X" 5 "X" 8 "X"
        check_win 0 "X" 4 "X" 8 "X"
        check_win 2 "X" 4 "X" 6 "X"
        check_draw
    else
        echo "That space is already taken. Try again."
        continue
    fi

    # Player O turn
    print_board
    echo "Player O, choose a space (1-9):"
    read o_choice
    if [[ ${board[$o_choice-1]} == "." ]]; then
        board[$o_choice-1]="O"
        check_win 0 "O" 1 "O" 2 "O"
        check_win 3 "O" 4 "O" 5 "O"
        check_win 6 "O" 7 "O" 8 "O"
        check_win 0 "O" 3 "O" 6 "O"
        check_win 1 "O" 4 "O" 7 "O"
        check_win 2 "O" 5 "O" 8 "O"
        check_win 0 "O" 4 "O" 8 "O"
        check_win 2 "O" 4 "O" 6 "O"
        check_draw
    else
        echo "That space is already taken. Try again."
        continue
    fi
done
