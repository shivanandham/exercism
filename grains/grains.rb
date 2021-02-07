=begin
Write your code for the 'Grains' exercise in this file. Make the tests in
`grains_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/grains` directory.
=end

class Grains
    @@board = 1..64
  
    def self.square(number)
      validate(number)
      2 ** (number - 1)
    end
  
    def self.total
      @@board.map { |number| square(number) }.sum
    end
  
    def self.validate(number)
      raise ArgumentError unless @@board.include?(number)
    end
  end