=begin
Write your code for the 'Dominoes' exercise in this file. Make the tests in
`dominoes_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dominoes` directory.
=end

class Dominoes

    private
  
    def initialize(dominos)
      self.chain = dominos.empty? ? true : build_chain([], dominos)
    end
  
    attr_writer :chain
  
    def build_chain(chain, pile)
      pile.any? { |stone| place(stone, chain, pile - [stone]) }
    end
  
    def match_and_ends_match?(stone, chain)
      return stone.first == stone.last if chain.empty?
  
      reversed = stone.reverse
      (chain.last.last == stone.first and chain.first.first == stone.last) or
        (chain.last.last == reversed.first and chain.first.first == reversed.last)
    end
  
    def place(stone, chain, pile)
      if pile.empty?
        match_and_ends_match?(stone, chain)
  
      elsif chain.empty?
        build_chain([stone], pile) or build_chain([stone.reverse], pile)
  
      # at least one end of the stone matches the end of the chain
      elsif stone.include?(chain.last.last)
        oriented_stone = (stone.first == chain.last.last) ? stone : stone.reverse
        build_chain(chain << oriented_stone, pile)
  
      else
        false
      end
    end
  
    public
  
    attr_reader :chain
  
    class << self
  
      def chain?(dominoes)
        Dominoes.new(dominoes).chain
      end
  
    end
  
  end