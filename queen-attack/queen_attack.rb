=begin
Write your code for the 'Queen Attack' exercise in this file. Make the tests in
`queen_attack_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/queen-attack` directory.
=end

class Queens
    attr_reader :white, :black
    def initialize(white: [], black: [])
        @white = white
        @black = black
        raise ArgumentError if error_white?(white)
        raise ArgumentError if error_black?(black)
    end

    def attack?
        if @white[0] == @black[0] || @white[1] == @black[1]
            true
        elsif (@white[0] - @black[0]).abs() == (@white[1] - @black[1]).abs()
            true
        else
            false
        end
    end

    def error_white?(white)
        if white.empty?
            false
        else
            if white[0] < 0 
                true
            elsif white[0] > 7
                true
            elsif white[1] < 0 
                true
            elsif white[1] > 7 
                true
            else
                false
            end
        end
    end

    def error_black?(black)
        if black.empty?
            false
        else
            if black[0] < 0 
                true
            elsif black[0] > 7
                true
            elsif black[1] < 0 
                true
            elsif black[1] > 7 
                true
            else
                false
            end
        end
    end

end