
file_path = 'thousands-google-words.txt'
words = File.read(file_path).split(' ') # return in array of strings

# Filter words based on size (between 5 and 12 letters)
filtered_words = words.select { |word| word.length >= 5 && word.length <= 12 }

# Generate a random index to select a word from the filtered list
random_index = rand(filtered_words.length)

# Load the selected word into your hash
selected_word = filtered_words[random_index]
p selected_word

################ METHODS ################

def check_input(input)

  if input.length == 1
    puts "You entered: #{input}"
    input
  else
    puts "Error: You can only enter one character, not more than that."
    puts "Enter a letter: "
    check_input(gets.chomp.downcase)
  end
end














############################################







dictionary = {}
dictionary[:random_word] = selected_word

# Print the selected word and the hash
puts "Random Word: #{selected_word}"
puts "Hash: #{dictionary}"


display = Array.new(selected_word.length, '_')
puts display.join('')

lifes = selected_word.length
puts "You are with #{lifes} guesses"


guessed_letters = []


loop do
  puts "Guessed letters: #{guessed_letters.join(' ')}"

  puts "Enter your guess: "
  input = gets.chomp.downcase
  guess = check_input(input)

  if dictionary[:random_word].include?(guess) && guess.match?(/[a-z]/) && !guessed_letters.include?(guess)
    guessed_letters << guess
    correct_guess = false



    selected_word.each_char.with_index do |char, index|
      if char == guess
        display[index] = guess
        correct_guess = true
        end
    end


    puts "Correct guess!" if correct_guess
    puts display.join(' ')


    if display.join('') == selected_word
      puts "Congratulations! You guessed the word: #{selected_word}"
      break
    end




  else
    puts 'no it does not exist'
    puts "Guesses left: #{lifes = lifes- 1}"
  end

end


# display.gsub!('_', guess)
# guessed_letters = []
# p display
