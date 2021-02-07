=begin
Write your code for the 'Alphametics' exercise in this file. Make the tests in
`alphametics_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/alphametics` directory.
=end

class Alphametics
    def self.solve(puzzle)
      letters = puzzle.scan(/[A-Z]/).uniq
      (0..9).to_a.permutation(letters.count).each do |digits|
        map = Hash[*letters.zip(digits).flatten]
        substituted = puzzle.gsub(/[A-Z]/,map)
        next if substituted.match(/(\s|\A)0/)
        return map if eval(substituted)
      end
      {}
    end
  end