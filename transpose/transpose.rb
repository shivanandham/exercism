=begin
Write your code for the 'Transpose' exercise in this file. Make the tests in
`transpose_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/transpose` directory.
=end

module Transpose
    def self.transpose(input)
      lines = input.split("\n")
      max_line_length = lines.map(&:length).max
      lines
        .map { |line| line.ljust(max_line_length, FILLER) }
        .map(&:chars)
        .transpose
        .map(&:join)
        .join("\n")
        .gsub(/#{FILLER}+$/, "")
        .gsub(/#{FILLER}/, " ")
    end
  
    private
  
    FILLER = "\0"
  end