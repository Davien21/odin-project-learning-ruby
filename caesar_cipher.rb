A_ASCII = 'a'.ord
Z_ASCII = 'z'.ord
TOTAL_NO_OF_CHARS = 26 # From A - Z is 26 characters

def get_capital_indexes(word)
  word.split('').each_index.select do |index|
    word[index] =~ /[A-Z]/
  end
end

def caesar_cipher(word, shift_factor)
  capital_indexes = get_capital_indexes(word)
  
  cypher = word.split('').map do |char|
    ascii_value = char.downcase.ord

    if (ascii_value < A_ASCII || ascii_value > Z_ASCII)
      next char
    end

    ascii_value += shift_factor
    
    if ascii_value > Z_ASCII 
      ascii_value -= TOTAL_NO_OF_CHARS
    end

    ascii_value.chr
  end

  capital_indexes.each { |index| cypher[index].upcase! }

  cypher.join()
end

# Example:
p caesar_cipher("What a string!", 5)