=begin
Write your code for the 'Matching Brackets' exercise in this file. Make the tests in
`matching_brackets_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matching-brackets` directory.
=end

module Brackets

    OPENING = '([{'
    CLOSING = ')}]'
  
    BRACKETS = /[\[\]\{\}\(\)]/
  
    COUNTERPARTS = {
      "[" => "]",
      "(" => ")",
      "{" => "}"
    }
  
    def self.paired?(text)
  
      collected = text.scan BRACKETS
      return true if collected.to_s.empty?
  
      decision = nil
      opening = []
      collected.each do |bracket|
  
        if OPENING.include? bracket
          opening << bracket
        elsif bracket != COUNTERPARTS[opening.last]
          decision = false
        else
          opening.pop
        end
  
      end
  
      decision = false unless opening.empty?
  
      return decision unless decision.nil?
      true
    end
  
  end