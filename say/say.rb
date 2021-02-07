=begin
Write your code for the 'Say' exercise in this file. Make the tests in
`say_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/say` directory.
=end

class Say
    def initialize(number)
      @number = number
    end
  
    ONES = { 1 => "one", 2 => "two", 3 => "three", 4 =>  "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine" }
  
    TEENS = { 0 => "ten", 1 => "eleven", 2 => "twelve", 3 => "thirteen",
        4 =>  "fourteen", 5 => "fifteen", 6 => "sixteen", 7 => "seventeen", 8 => "eighteen", 9 => "nineteen" }
  
    TENS = { 2 => "twenty", 3 => "thirty", 4 =>  "forty", 5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninty"
    }
  
    LARGE_NUMS = {
        1_000_000_000 => "billion",
        1_000_000 => "million",
        1_000 => "thousand"
    }
  
    def in_english
      raise ArgumentError.new if @number < 0 || @number > 999_999_999_999
      return "zero" if @number == 0
  
      num = @number
      word = ""
  
      LARGE_NUMS.each do |key, value|
        if num / key > 0
          word = hundred_helper(num / key, word) + " " + value
          num = num % key
        end
      end
  
      if num > 0
        word = hundred_helper(num, word)
      end
  
      return word
    end
  
    def hundred_helper(num, word)
      word += " " unless word.empty?
  
      if num / 100 > 0
        word += "#{ONES[num / 100]} hundred"
  
        num = num % 100
        if num % 100 != 0
          word += " "
          word += tens_helper(num % 100) ## takes care of nums 0 - 99
        end
      else # if num is < 100
        word += tens_helper(num)
      end
  
      return word
    end
  
    def tens_helper(num)
      # input 35
      # output thirty-five
      word = ""
  
      if num / 10 > 1 && num / 10 < 10 # num is within (including) 20 - 99
        (num % 10 > 0) ? word += "#{TENS[num / 10]}-#{ONES[num % 10]}" : word += TENS[num / 10]
      elsif num / 10 == 1 # num is from 10 - 19
        word += TEENS[num % 10]
      elsif num / 10 == 0 # num is < 10
        word += ONES[num % 10]
      end
  
      return word
    end
  end