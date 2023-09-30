
file_path = 'thousands-google-words.txt'
words = File.read(file_path).split(' ') # return in array of strings

# Filter words based on size (between 5 and 12 letters)
filtered_words = words.select { |word| word.length >= 5 && word.length <= 12 }

# Generate a random index to select a word from the filtered list
random_index = rand(filtered_words.length)

# Load the selected word into your hash
selected_word = filtered_words[random_index]


dictionary = {}
dictionary[:random_word] = selected_word

# Print the selected word and the hash
puts "Random Word: #{selected_word}"
puts "Hash: #{dictionary}"


display = Array.new(selected_word.length, '_').join(' ')
p display



puts 'Enter your guess'
guess = gets.chomp

if dictionary[:random_word].include?(guess)
  puts 'yes it exists'


else
  puts 'no it does not exist'
end
