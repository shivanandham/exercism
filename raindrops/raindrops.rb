=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end
class Raindrops
    def self.convert n 
        song = ""
        song += "Pling" if n % 3 == 0
        song += "Plang" if n % 5 == 0
        song += "Plong" if n % 7 == 0
        return n.to_s if song.empty?
        return song if !song.empty?
    end
end
