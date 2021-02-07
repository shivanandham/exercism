=begin
Write your code for the 'Sum Of Multiples' exercise in this file. Make the tests in
`sum_of_multiples_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/sum-of-multiples` directory.
=end


class SumOfMultiples
    attr_reader :multiples
    def initialize(*multiples)
      @multiples = multiples
    end
  
    def to(to_value)
      multiple_numbers = []
      unless multiples.sum.zero?
        (0...to_value).each do |number|
          multiples.each do |m|
            multiple_numbers.append(number) if (number % m).zero?
          end
        end
      end
  
      multiple_numbers.uniq.sum
    end
  end