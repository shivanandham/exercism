=begin
Write your code for the 'Collatz Conjecture' exercise in this file. Make the tests in
`collatz_conjecture_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/collatz-conjecture` directory.
=end

module CollatzConjecture
    def self.steps(number)
      raise ArgumentError unless number.positive?
  
      (0..).each do |num_steps|
        return num_steps if number == 1
        number = next_number(number)
      end
    end
  
    private
  
    def self.next_number(number)
      if number.even?
        number / 2
      else
        3 * number + 1
      end
    end
  end