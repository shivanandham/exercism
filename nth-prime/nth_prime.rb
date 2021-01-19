=begin
Write your code for the 'Nth Prime' exercise in this file. Make the tests in
`nth_prime_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/nth-prime` directory.
=end

class Prime

    def self.nth(num)
      raise ArgumentError unless num > 0  
        x = 2
        primes = [x]
        while primes.size != num
            x += 1
            next if primes.any? { |p| x % p  == 0 }
            primes << x
        end
        primes.last
    end
  
  end