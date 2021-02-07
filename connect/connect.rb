=begin
Write your code for the 'Connect' exercise in this file. Make the tests in
`connect_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/connect` directory.
=end

class Board
    NEIGHBORS = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, -1], [-1, 1]].freeze
  
    attr_reader :limit, :board_x, :board_o
  
    def initialize(board)
      board = board.map(&:split)
      @limit = board.first.length - 1
      @board_o = build_board(board, 'O')
      @board_x = build_board(board.transpose, 'X')
    end
  
    def winner
      return 'X' if winner?(board_x)
      return 'O' if winner?(board_o)
      ''
    end
  
    private
  
    def winner?(stones)
      start_point = stones.select { |stone| stone.first == 0 }
      start_point.any? { |stone| neighbor?(stone, stones) }
    end
  
    def neighbor?(stone, stones)
      return true if stone[0] == @limit
  
      next_stones = neighbors(stone[0], stone[1], stones)
      return false if next_stones.empty?
  
      stones.delete(stone)
      next_stones.any? { |next_stone| neighbor?(next_stone, stones) }
    end
  
    def neighbors(x, y, stones)
      stones.select do |stone_x, stone_y|
        neighbor_positions(x, y).any? { |neighbor_x, neighbor_y| stone_x == neighbor_x && stone_y == neighbor_y }
      end
    end
  
    def neighbor_positions(x, y)
      NEIGHBORS.map { |dx, dy| [x + dx, y + dy] }
    end
  
    def build_board(board, player)
      (0..limit).each_with_object([]) do |x, result|
        (0..limit).each { |y| result << [x, y, board[x][y]] if board[x][y] == player }
      end
    end
  end