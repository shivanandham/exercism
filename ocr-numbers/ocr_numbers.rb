=begin
Write your code for the 'Ocr Numbers' exercise in this file. Make the tests in
`ocr_numbers_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/ocr-numbers` directory.
=end

class OcrNumbers
    DIGIT_HEIGHT = 4
    DIGIT_WIDTH = 3
    NUMBERS = {
      ' _ | ||_|   ' => '0',
      '     |  |   ' => '1',
      ' _  _||_    ' => '2',
      ' _  _| _|   ' => '3',
      '   |_|  |   ' => '4',
      ' _ |_  _|   ' => '5',
      ' _ |_ |_|   ' => '6',
      ' _   |  |   ' => '7',
      ' _ |_||_|   ' => '8',
      ' _ |_| _|   ' => '9'
    }
  
    def self.convert(input)
      @strings = input.split("\n")
      raise ArgumentError unless correct_size(@strings)
  
      @columns = @strings.first.size / DIGIT_WIDTH
      @strings.each_slice(DIGIT_HEIGHT).each_with_object([]) { |row, result|
        result << parse_row(row)
      }.join(',')
    end
  
    private
  
    def self.parse_row(row)
      digits = Array.new(@columns) { [] }
  
      row.each do |string|
        string.chars.each_slice(DIGIT_WIDTH).with_index { |combination, index|
          digits[index] << combination.join
        }
      end
  
      digits.map { |string| parse_digit(string.join) }.join
    end
  
    def self.parse_digit(input)
      NUMBERS[input] || '?'
    end
  
    def self.correct_size(strings)
      strings.size % DIGIT_HEIGHT == 0 && strings.all? { |string| string.size % DIGIT_WIDTH == 0 }
    end
  end