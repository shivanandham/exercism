=begin
Write your code for the 'Poker' exercise in this file. Make the tests in
`poker_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/poker` directory.
=end

class PlayingCard

    private
  
    def initialize(card)
      self.face = card.slice(0..-2)
      self.suit = card[-1]
      self.value = normalize_face
    end
  
    attr_writer :face, :suit, :value
  
    def normalize_face
      case face
      when "J"
        11
      when "Q"
        12
      when "K"
        13
      when "A"
        14
      else
        face.to_i
      end
    end
  
    public
  
    attr_reader :face, :suit, :value
  
  end
  
  class PokerHand
  
    HIGH_CARD       = 0
    PAIR            = 1
    TWO_PAIR        = 2
    THREE_OF_A_KIND = 3
    STRAIGHT        = 4
    FLUSH           = 5
    FULL_HOUSE      = 6
    FOUR_OF_A_KIND  = 7
    STRAIGHT_FLUSH  = 8
  
    private
  
    def initialize(initial_hand)
      self.initial_hand = initial_hand
      self.hand = initial_hand.map { |card| PlayingCard.new(card) }
      self.values = self.hand.map { |playing_card| playing_card.value }
      self.suits = self.hand.map { | playing_card| playing_card.suit }
      self.hand_value = calculate_hand_value
    end
  
    attr_accessor :values, :suits
    attr_writer :hand, :hand_value, :initial_hand
  
    def calculate_hand_value
      value_freqs = values.reduce(Hash.new(0)) { |acc, value| acc[value] += 1; acc }
      matches = value_freqs.values.sort.reverse
      combined_score(values_based_score(matches, value_freqs), suits_based_score())
    end
  
    def values_based_score(matches, value_freqs)
      case matches
      when [4, 1]
        FOUR_OF_A_KIND +
          tiebreaker([value_freqs.key(1), value_freqs.key(4)])
      when [3, 2]
        FULL_HOUSE +
          tiebreaker([value_freqs.key(2), value_freqs.key(3)])
      when [3, 1, 1]
        THREE_OF_A_KIND +
          tiebreaker(
            value_freqs.keys.sort.select { |k| value_freqs[k] == 1 } +
            [value_freqs.key(3)]
          )
      when [2, 2, 1]
        TWO_PAIR +
          tiebreaker(
            [value_freqs.key(1)] +
            value_freqs.keys.sort.select { |k| value_freqs[k] == 2 }
          )
      when [2, 1, 1, 1]
        PAIR +
          tiebreaker(
            value_freqs.keys.sort.select { |k| value_freqs[k] == 1 } +
            [value_freqs.key(2)]
          )
      else
        if (values.max - values.min == 4)
          STRAIGHT + tiebreaker([values.max])
        elsif  (values.sort == [2, 3, 4, 5, 14])
          STRAIGHT + tiebreaker([5])
        else
          HIGH_CARD + tiebreaker(values.sort)
        end
      end
  
    end
  
    def suits_based_score
      if suits.all? { |suit| suit == suits.first }
        FLUSH + tiebreaker(values.sort)
      else
        HIGH_CARD
      end
    end
  
    def combined_score(values_score, suits_score)
      if values_score.to_i == STRAIGHT and suits_score.to_i == FLUSH
        values_score - STRAIGHT + STRAIGHT_FLUSH
      else
        suits_score.to_i == FLUSH ? suits_score : values_score
      end
    end
  
    def tiebreaker(values)
      values.reduce(0) { |sum, value| (sum + value) / 100.0 }
    end
  
    public
  
    attr_reader :initial_hand, :hand, :hand_value
  
  end
  
  class Poker
  
    private
  
    attr_accessor :hands
    attr_writer :winners
  
    def initialize(final_hands)
      self.hands =
        final_hands
          .map { |hand| PokerHand.new(hand) }
          .sort { |a, b| b.hand_value <=> a.hand_value }
  
      self.winners = hands.select { |hand| hand.hand_value == hands.first.hand_value }
    end
  
    public
  
    attr_reader :winners
  
    def best_hand
      winners.map { |hand| hand.initial_hand }
    end
  
  end