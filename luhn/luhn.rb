=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end

class Luhn
    def self.valid?(card_num)
      no_spaces = card_num.gsub(/\s/, "") 
      if no_spaces.length <= 1 || no_spaces.match?(/[^0-9]/) then
        return false
      end
      
      int_arr = no_spaces.split("").map(&:to_i)
  
      i = int_arr.length - 2
      while i >= 0
        int_arr[i] = if int_arr[i] * 2 > 9 then 
          int_arr[i] * 2 - 9 
        else int_arr[i] * 2
        end
        
        i -= 2
      end
  
      if int_arr.reduce(:+) % 10 == 0 then true else false end
    end
  end