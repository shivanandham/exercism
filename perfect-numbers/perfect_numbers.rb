=begin
Write your code for the 'Perfect Numbers' exercise in this file. Make the tests in
`perfect_numbers_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/perfect-numbers` directory.
=end

module PerfectNumber
    def self.classify(number)
      raise RuntimeError unless number.positive?
  
      aliquot = (1...number)
        .select { |n| number % n == 0 }
        .sum
  
      case
      when aliquot == number; "perfect"
      when aliquot > number; "abundant"
      else "deficient"
      end
    end
  end