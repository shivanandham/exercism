=begin
Write your code for the 'Rna Transcription' exercise in this file. Make the tests in
`rna_transcription_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rna-transcription` directory.
=end

class Complement
    RNA_CODE = {
      'G' => 'C',
      'C' => 'G',
      'A' => 'U',
      'T' => 'A'
    }
  
    def self.of_dna(dna_code)
      dna_code.each_char.with_index do |base, idx|
        dna_code[idx] = RNA_CODE[base]
      end
    end
  end