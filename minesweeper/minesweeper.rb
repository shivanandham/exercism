=begin
Write your code for the 'Minesweeper' exercise in this file. Make the tests in
`minesweeper_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/minesweeper` directory.
=end

class Board
    NEIGHBOURS_RELATIVE_COORDINATES = [
      [-1, -1], [-1, 0], [-1, 1],
      [0, -1], [0, 1],
      [1, -1], [1, 0], [1, 1],
    ].freeze
  
    private_constant :NEIGHBOURS_RELATIVE_COORDINATES
  
    def self.transform(lines)
      Board.new(lines).transform
    end
  
    def initialize(lines)
      raise ArgumentError unless valid_lines?(lines)
      @lines = lines
    end
  
    def transform
      @lines
        .each_with_index
        .map(&method(:transform_line))
    end
  
    private
  
    def valid_lines?(lines)
      valid_length?(lines) && valid_borders?(lines) && valid_content?(lines)
    end
  
    def valid_length?(lines)
      lines.all? { |line| line.length == lines.first.length }
    end
  
    def valid_borders?(lines)
      [lines.first, lines.last].all? { |line| line.match?(/\A(\+)[\-]*\1\z/) }
    end
  
    def valid_content?(lines)
      lines[1...-1].all? { |line| line.match?(/\A(\|)[\s\*]*\1\z/) }
    end
  
    def transform_line(line, line_index)
      line
        .each_char
        .each_with_index
        .map { |char, char_index| transform_char(char, char_index, line_index) }
        .join
    end
  
    def transform_char(char, char_index, line_index)
      return char unless char == " "
  
      near_mines = near_mines(char_index, line_index)
      return " " unless near_mines.positive?
      near_mines
    end
  
    def near_mines(char_index, line_index)
      NEIGHBOURS_RELATIVE_COORDINATES
        .map { |dx, dy| [char_index + dx, line_index + dy] }
        .select { |ci, li| @lines[li][ci] == "*" }
        .count
    end
  end