=begin
Write your code for the 'ISBN Verifier' exercise in this file. Make the tests in
`isbn_verifier_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isbn-verifier` directory.
=end

class IsbnVerifier
    WEIGHTS = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
    ISBN_FORMAT = /^[0-9]{9}[0-9X]$/ 
  
    def self.valid?(string)
      normalized = normalize(string)
      valid_format?(normalized) && check_digits(normalized)
    end
  
    def self.check_digits(string)
      string
        .chars
        .map {|c| c == 'X' ? 10 : c.to_i}
        .zip(WEIGHTS)
        .map {|digit, weight| digit * weight}
        .sum % 11 == 0
    end
  
    def self.normalize(string)
      string = string.delete('-')
    end
  
    def self.valid_format?(string)
      string[ISBN_FORMAT]
    end
  end