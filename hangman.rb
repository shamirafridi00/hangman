require 'json'
require 'fileutils'  # To manage directories and files


# Define the directory to store saved games
SAVED_GAMES_DIR = 'saved_games'

# Create the saved games directory if it doesn't exist
FileUtils.mkdir_p(SAVED_GAMES_DIR)



file_path = 'thousands-google-words.txt'
words = File.read(file_path).split(' ') # return in array of strings

# Filter words based on size (between 5 and 12 letters)
filtered_words = words.select { |word| word.length >= 5 && word.length <= 12 }

# Generate a random index to select a word from the filtered list
random_index = rand(filtered_words.length)

# Load the selected word into your hash
selected_word = filtered_words[random_index]


################ METHODS ################

def check_input(input)

  if input.length == 1 || input == 'save' || input == 'load' || input == 'exit'
    puts "You entered: #{input}"
    input
  else
    puts 'Error: You can only enter one character, not more than that. If you want to save the game, enter "save". If you want to load a game, enter "load". If you want to exit, enter "exit".'
    puts 'Enter a letter: '
    check_input(gets.chomp.downcase)
  end
end

# Define a method to save the game state to a JSON file with a custom name
def save_game(selected_word, display, lifes, guessed_letters, alphabet)
  puts 'Enter a name for your save file: '
  save_file_name = gets.chomp
  save_file_path = File.join(SAVED_GAMES_DIR, "#{save_file_name}.json")

  game_state = {
    selected_word: selected_word,
    display: display,
    lifes: lifes,
    guessed_letters: guessed_letters,
    alphabet: alphabet
  }

  File.open(save_file_path, 'w') do |file|
    file.write(JSON.generate(game_state))
  end

  puts "Game saved as #{save_file_name}."
end


# Define a method to load a saved game by specifying the file name
def load_game_by_name(file_name)
  save_file_path = File.join(SAVED_GAMES_DIR, "#{file_name}.json")

  if File.exist?(save_file_path)
    game_state = JSON.parse(File.read(save_file_path), symbolize_names: true)
    game_state[:display] = game_state[:display].split('')  # Convert display back to an array
    game_state
  else
    nil
  end
end

############################################


dictionary = {}
dictionary[:random_word] = selected_word

# Print the selected word and the hash
puts "Random Word: #{selected_word}"
puts "Hash: #{dictionary}"


################  <<<<<<<<<   DISPLAY   >>>>>>>>>>>>      ############################
display = Array.new(selected_word.length, '_')
puts ('Weclome to Hangman!')
puts ('Guess the word in given number of tries or less! or you will lose!')
puts('Available guess are varies as per the lenght of the word which you need to be gussed')
puts display.join('')

lifes = selected_word.length
puts "Your remaining guesses: #{lifes}"


guessed_letters = []
alphabet = ('a'..'z').to_a  #an array of all lowercase letters


################  <<<<<<<<<   Main Loop   >>>>>>>>>>>>      ############################


loop do
  puts "Guessed letters so far: #{guessed_letters.join(' ')}"
  puts "Available letters: #{alphabet.join(' ')}"

  puts 'Enter your guess (or type "save" to save the game, "load" to load a saved game): '
  input = gets.chomp.downcase
  guess = check_input(input)

  if input == 'save'
    save_game(selected_word, display.join(''), lifes, guessed_letters, alphabet)
  elsif input == 'load'
    puts 'Enter the name of the saved game file you want to load: '
    load_file_name = gets.chomp
    loaded_game_state = load_game_by_name(load_file_name)

    if loaded_game_state
      selected_word = loaded_game_state[:selected_word]
      display = loaded_game_state[:display]
      lifes = loaded_game_state[:lifes]
      guessed_letters = loaded_game_state[:guessed_letters]
      alphabet = loaded_game_state[:alphabet]
      puts 'Game loaded.'
      puts display.join(' ')

    else
      puts 'No saved game found with that name.'
      end


  elsif input == 'exit'
    break
  end



  if alphabet.include?(guess) && !guessed_letters.include?(guess)
    guessed_letters << guess
    alphabet.delete(guess)
    correct_guess = false

    selected_word.each_char.with_index do |char, index|
      if char == guess
        display[index] = guess
        correct_guess = true
        end
    end


    if correct_guess
      puts 'Good guess!'
    else
      lifes -= 1
      puts 'Wrong Guess!'
      puts "Guesses left: #{lifes}"
    end
    puts display.join(' ')


    if display.join('') == selected_word
      puts "Congratulations! You guessed the word: #{selected_word}"
      break
    end



  else
    puts "You entered already this letter. Please enter a single letter that you haven't guessed before."
    lifes -= 1
    guessed_letters << guess
    alphabet.delete(guess)
    puts "Guessed letters: #{guessed_letters.join(' ')}"


    if lifes.zero?
      puts "You lost! The word was: #{selected_word}"
      break
    else
      puts "Guesses left: #{lifes}"
    end
  end

end
