=begin
Write your code for the 'Nucleotide Count' exercise in this file. Make the tests in
`nucleotide_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/nucleotide-count` directory.
=end

class Nucleotide
	Default = {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
	def self.from_dna(dna)
		raise ArgumentError if (dna.upcase.chars.uniq - Default.keys).size != 0
		@@dna = dna
		self
	end
	def self.count(let)
		@@dna.count(let)
	end
	def self.histogram
		@@dna.chars.reduce(Default.clone){ |h, c| h[c] += 1 ; h}
	end
end