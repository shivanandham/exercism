=begin
Write your code for the 'Resistor Color Trio' exercise in this file. Make the tests in
`resistor_color_trio_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-trio` directory.
=end

class ResistorColorTrio
    def initialize(sequence)
      @sequence = sequence
      throw ArgumentError unless valid_sequence
    end
  
    def label
      first, second, third = @sequence.map { |color| COLORS_VALUE.index(color) }
      value = (first * 10 + second) * (10 ** third)
      formatted_value, scale = if value >= 1000
          [value / 1000, "kiloohms"]
        else
          [value, "ohms"]
        end
      "Resistor value: #{formatted_value} #{scale}"
    end
  
    private
  
    COLORS_VALUE = %w[black brown red orange yellow green blue violet grey white]
  
    def valid_sequence
      @sequence.all? { |color| COLORS_VALUE.include?(color) }
    end
  end