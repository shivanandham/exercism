=begin
Write your code for the 'All Your Base' exercise in this file. Make the tests in
`all_your_base_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/all-your-base` directory.
=end

class BaseConverter
    def self.convert(input_base, digits, output_base)
      raise ArgumentError if input_base < 2 || output_base < 2 || digits.any?{ |d| d < 0 || d >= input_base}
      return [0] if digits.empty? 
      target = digits.reduce(0){ |acc, d| acc*input_base + d }
      ans = []
      while target >= output_base
        (something, digit) = target.divmod(output_base)
        target = something
        ans << digit
      end
      ans << target
      ans.reverse
    end
  end