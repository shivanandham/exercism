=begin
Write your code for the 'Run Length Encoding' exercise in this file. Make the tests in
`run_length_encoding_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/run-length-encoding` directory.
=end


module RunLengthEncoding
    def self.encode(input = '')
      input.scan(/(([A-z\s])\2*)/)
           .map(&:first)
           .map { |seq| "#{seq.length > 1 ? seq.length : ''}#{seq[0]}" }
           .join
    end
  
    def self.decode(input = '')
      input.scan(/(\d*)([A-z\s])/)
           .map { |count, char| char * (count.empty? ? 1 : count.to_i) }
           .join
    end
  end