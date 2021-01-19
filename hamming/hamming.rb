=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end

class Hamming
    def self.compute first, second
        throw ArgumentError if first.length != second.length

        distance = 0
        first.each_char.with_index do |i, index|
            distance += 1 if i != second[index]
        end
        distance
    end
end
