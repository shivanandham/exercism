=begin
Write your code for the 'Difference Of Squares' exercise in this file. Make the tests in
`difference_of_squares_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/difference-of-squares` directory.
=end

class Squares
    attr_reader :square_of_sum, :sum_of_squares, :difference
    def initialize(value)
      values = (1..value).to_a
      @square_of_sum = values.sum**2
      @sum_of_squares = values.sum{|value| value ** 2}
      @difference = @square_of_sum - @sum_of_squares
    end
  end