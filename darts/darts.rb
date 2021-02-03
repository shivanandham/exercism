=begin
Write your code for the 'Darts' exercise in this file. Make the tests in
`darts_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/darts` directory.
=end


class Darts
    attr_reader :score
  
    def initialize(x, y)
      @score = calculate_score(x, y)
    end
  
    private
  
    def calculate_score(x, y)
      radius_to_dart = (x * x + y * y) ** 0.5
      if radius_to_dart <= 1
        10
      elsif radius_to_dart <= 5
        5
      elsif radius_to_dart <= 10
        1
      else
        0
      end
    end
  end