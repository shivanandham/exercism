=begin
Write your code for the 'Largest Series Product' exercise in this file. Make the tests in
`largest_series_product_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/largest-series-product` directory.
=end

class ArgumentError < StandardError; end

class Series
  VERSION = 1
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def largest_product(length)
    return 1 if length == 0
    fail ArgumentError if invalid_string_or_length?(length)

    integers = string.chars.map(&:to_i)
    result = 0

    integers.each_cons(length) do |candidate|
      candidate_result = candidate.inject(:*)
      result = candidate_result if candidate_result > result
    end

    result
  end

  def invalid_string_or_length?(length)
    string.empty? || string =~ /\D/ || length > string.size
  end
end