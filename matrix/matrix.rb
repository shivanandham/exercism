=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
    def initialize(input)
      @input = input.each_line.map{|x| x.strip.split(" ").map(&:to_i) }
    end
  
    def rows
      @input
    end
  
    def columns
      row_count = @input.length
      col_count = @input.first.length
      result = []
  
      (0...col_count).each do |x|
        result << []
        (0...row_count).each do |y|
          result[x][y] = @input[y][x]
        end
      end
      result
    end
  end