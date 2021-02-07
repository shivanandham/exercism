=begin
Write your code for the 'Anagram' exercise in this file. Make the tests in
`anagram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/anagram` directory.
=end

class Anagram
    def initialize(word)
      @word = word
    end
  
    def match(words)
      words.select { |word| anagrams?(word, @word) }
    end
  
    private
  
    def anagrams?(a, b)
      a.downcase != b.downcase &&
        a.downcase.chars.sort == b.downcase.chars.sort
    end
  end