=begin
Write your code for the 'Scrabble Score' exercise in this file. Make the tests in
`scrabble_score_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/scrabble-score` directory.
=end

class Scrabble

    LETTER_VALUES = {
      /[AEIOULNRST]/ => 1,
      /[DG]/ => 2,
      /[BCMP]/ => 3,
      /[FHVWY]/ => 4,
      /[K]/ => 5,
      /[JX]/ => 8,
      /[QZ]/ => 10
    }
  
    def initialize word
      @word = word.to_s.upcase
  
    end
  
    def self.score word
      (new word).score
    end
  
    def score
      word_score = 0
      LETTER_VALUES.each do |letters, value|
        word_score += (@word.scan(letters).count * value)
      end
      word_score
    end
  end