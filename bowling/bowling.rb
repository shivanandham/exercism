=begin
Write your code for the 'Bowling' exercise in this file. Make the tests in
`bowling_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bowling` directory.
=end

class Game
    NUMBER_OF_FRAMES = 10
    PINS_IN_A_FRAME = 10
  
    class BowlingError < StandardError; end
  
    attr_reader :first_frame, :current_frame
  
    def initialize
      @first_frame = Frame.new
      @current_frame = @first_frame
    end
  
    def roll(pins)
      @current_frame = @current_frame.roll(pins)
    end
  
    def score
      raise BowlingError unless current_frame.number == NUMBER_OF_FRAMES
  
      frames.map(&:score).sum
    end
  
    private
  
    def frames
      Enumerator.new do |frames|
        frame = first_frame
        loop do
          frames << frame
          frame = frame.next_frame
          break if frame.nil?
        end
      end
    end
  
    class Frame
      MAXIMUM_ROLLS = 2
  
      attr_reader :number, :rolls, :next_frame
    
      def initialize(number=1)
        @number = number
        @rolls = []
      end
    
      def roll(pins)
        validate_pins!(pins)
        raise Game::BowlingError if rolls.sum + pins > PINS_IN_A_FRAME
    
        rolls << pins
    
        return self unless frame_over?
        @next_frame = move_to_next_frame
      end
    
      def score
        rolls.sum + bonus
      end
    
      protected
  
      def validate_pins!(pins)
        raise Game::BowlingError if pins.negative? || pins > PINS_IN_A_FRAME
      end
    
      def frame_over?
        strike? || rolls.length == MAXIMUM_ROLLS
      end
    
      def strike_bonus
        bonus = rolls.sum
        bonus += next_frame.rolls.first if strike?
        bonus
      end
    
      def spare_bonus
        rolls.first
      end
    
      def strike?
        rolls.first == PINS_IN_A_FRAME
      end
    
      def spare?
        rolls.sum == PINS_IN_A_FRAME
      end
    
      private
  
      def bonus
        if strike?
          next_frame.strike_bonus
        elsif spare?
          next_frame.spare_bonus
        else
          0
        end
      end
    
      def move_to_next_frame
        if moving_to_last_frame?
          LastFrame.new
        else
          Frame.new(number + 1)
        end
      end
    
      def moving_to_last_frame?
        number + 1 == NUMBER_OF_FRAMES
      end
    end
    
    class LastFrame < Frame
      def initialize
        super(NUMBER_OF_FRAMES)
      end
    
      def roll(pins)
        raise Game::BowlingError if game_over?
        validate_pins!(pins)
    
        rolls << pins
    
        validate_strike! if strike?
        self
      end
    
      def score
        raise Game::BowlingError unless game_over?
    
        rolls.sum
      end
    
      def strike_bonus
        rolls[0..1].sum
      end
    
      private
  
      def validate_strike!
        return if rolls[1] == PINS_IN_A_FRAME
        return if rolls[1..].sum <= PINS_IN_A_FRAME
  
        raise Game::BowlingError
      end
  
      def spare?
        rolls[0..1].sum == PINS_IN_A_FRAME
      end
    
      def game_over?
        return rolls.length == 3 if strike? || spare?
        
        rolls.length == 2
      end
    end
  end