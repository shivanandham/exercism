=begin
Write your code for the 'Pythagorean Triplet' exercise in this file. Make the tests in
`pythagorean_triplet_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pythagorean-triplet` directory.
=end

class Triplet
    def self.where(max_factor:, min_factor: 1, sum: nil)
      [*min_factor..max_factor]
        .combination(3)
        .map { |factors| new(*factors) }
        .select(&:pythagorean?)
        .select { |triplet| sum.nil? || triplet.sum == sum }
    end
  
    def initialize(a, b, c)
      @a = a
      @b = b
      @c = c
    end
  
    def sum
      @a + @b + @c
    end
  
    def product
      @a * @b * @c
    end
  
    def pythagorean?
      @a ** 2 + @b ** 2 == @c ** 2
    end
  end