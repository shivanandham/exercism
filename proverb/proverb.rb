=begin
Write your code for the 'Proverb' exercise in this file. Make the tests in
`proverb_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/proverb` directory.
=end

class Proverb

    attr_reader :word_chain, :qualifier
  
    def initialize(*word_chain, qualifier: '')
      @word_chain = word_chain
      @qualifier = qualifier
    end
  
    def to_s
  
      word_chain.each_cons(2).map { |first, second|
        "For want of a #{first} the #{second} was lost.\n" }
        .join
        .concat("And all for the want of a #{qualifier} #{word_chain.first}.")
        .squeeze(' ')
    end
  end