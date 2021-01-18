=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end

class Phrase
    def initialize phrase
        @phrase = phrase
    end
    def word_count 
        single = @phrase.downcase.split(/[^0-9a-z']+/).reject(&:empty?)
        single.map!{|word| word.delete_prefix("'").delete_suffix("'")}.uniq!
        @phrase = @phrase.downcase.split(/[^0-9a-z']+/).reject(&:empty?)
        @phrase.map!{|word| word.delete_prefix("'").delete_suffix("'")}
        dict = Hash.new
        single.each do |word|
        dict[word] = @phrase.count(word)
        end
        dict
    end
end