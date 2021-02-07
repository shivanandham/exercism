=begin
Write your code for the 'Palindrome Products' exercise in this file. Make the tests in
`palindrome_products_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/palindrome-products` directory.
=end


class Palindrome
    attr_reader :value, :factors
  
    def initialize(value, factors)
      @value = value
      @factors = factors
    end
  end
  
  class Palindromes
    def initialize(min_factor: 1, max_factor:)
      @min_factor = min_factor
      @max_factor = max_factor
      @options = (min_factor..max_factor).flat_map do |a|
        (min_factor..max_factor).map do |b|
          a * b
        end
      end.uniq.sort
      @palindromes = []
    end
  
    def generate
      @options.each do |n|
        if n.digits == n.digits.reverse
          factors = (@min_factor..@max_factor).flat_map do |a|
            (@min_factor..@max_factor).select do |b|
              a * b == n
            end.map do |b|
              [a, b]
            end
          end.uniq(&:sum)
          @palindromes << Palindrome.new(n, factors)
        end
      end
    end
  
    def largest
      @palindromes.last
    end
  
    def smallest
      @palindromes.first
    end
  end