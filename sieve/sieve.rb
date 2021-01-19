=begin
Write your code for the 'Sieve' exercise in this file. Make the tests in
`sieve_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/sieve` directory.
=end

class Sieve
    def initialize(limit)
      @limit = limit
    end
    
    def primes
      result = []    
      n = 2
    
      if @limit >= 2
        nums = Array.new(@limit-1, true).unshift(false, false)
        while (n <= @limit) do  
          (n..@limit).step(n) do |i|
            nums[i] = false if i != n           
          end
          n += 1
        end
        nums.each.with_index {|b, i| result << i if b == true  }
      end
         
        result
      end
    end