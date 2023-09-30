# Hangman Game

## Introduction

This Hangman game is a simple command-line implementation in Ruby. It allows players to guess a hidden word one letter at a time. The game provides features to save and load games, offering flexibility and entertainment.

This project is part of The Odin Project curriculum, designed to help learners practice and improve their Ruby programming skills.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
  - [Starting a New Game](#starting-a-new-game)
  - [Guessing Letters](#guessing-letters)
  - [Saving a Game](#saving-a-game)
  - [Loading a Game](#loading-a-game)
- [Game Rules](#game-rules)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before playing the Hangman game, ensure that you have Ruby installed on your computer. You can download and install Ruby from the official [Ruby website](https://www.ruby-lang.org/).

## Installation

1. Clone the Hangman game repository from GitHub:

   ```bash
   git clone https://github.com/your-username/hangman.git
2. Navigate to the project directory:
    ```bash
    cd hangman
3. Run the game by executing the main Ruby file:
    ```bash
    ruby main.rb

## Usage

### Starting a New Game
- Upon running the game, it will display a welcome message and instructions.
- You will start with a hidden word represented by underscores (e.g., _ _ _ _ _) and a limited number of guesses based on the word's length.
- The available letters for guessing will be displayed.

## Guessing Letters

- To make a guess, enter a single lowercase letter.
- If your guess is correct, it will replace the underscores with the correctly guessed letter(s).
- If your guess is incorrect, your number of remaining guesses will decrease, and the incorrect letter will be added to the list of guessed letters.

## Saving a Game

- At any point during your turn, you can save the game by entering `save`.
- The game will prompt you to enter a name for your save file.
- The game state will be serialized and saved as a JSON file in a specified directory.

## Loading a Game

- To load a saved game, enter `load` when prompted to make a guess.
- You will be asked to enter the name of the saved game file you want to load.
- If a saved game with the provided name exists, it will load the game state, allowing you to continue from where you left off.

## Game Rules

- You must guess the entire word within a limited number of guesses to win.
- The available guesses vary based on the length of the word.
- If you run out of guesses without correctly guessing the word, you lose the game.

## Contributing

Contributions to the Hangman game project are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and test them thoroughly.
4. Commit your changes with clear and concise messages.
5. Push your changes to your fork.
6. Submit a pull request to the main repository.

## License

This Hangman game project is licensed under the MIT License. You are free to use, modify, and distribute the code for both personal and commercial purposes.


