def substrings(words, dictionary)
  words.split.reduce(Hash.new(0)) do |listing, word|
    dictionary.each do |item|
      if word =~ /#{item}/i
        listing[item] += 1
      end
    end
    listing
  end
end


# Example usage: 

dictionary = [
  "below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"
]

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
