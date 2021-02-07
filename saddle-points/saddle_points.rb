=begin
Write your code for the 'Saddle Points' exercise in this file. Make the tests in
`saddle_points_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/saddle-points` directory.
=end

class Matrix
    def initialize(str)
      @matrix = str.split("\n").map { |row| row.split(' ').map(&:to_i) }
    end
  
    def rows
      @matrix
    end
  
    def columns
      @columns ||= @matrix.transpose
    end
  
    def saddle_points
      nb_row = rows.size
      nb_col = columns.size
      result = []
  
      nb_row.times do |r|
        nb_col.times do |c|
          result << [r,c] if rows[r].max == columns[c].min
        end
      end
  
      result
    end
  end