=begin
Write your code for the 'Atbash Cipher' exercise in this file. Make the tests in
`atbash_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/atbash-cipher` directory.
=end

module Atbash
    ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z].freeze
  
    def self.encode(plaintext)
      sanitize(plaintext)
        .map { |letter| translate(letter, ALPHABET) }
        .join('')
        .scan(/.{1,5}/)
        .join(' ')
    end
  
    def self.decode(ciphertext)
      sanitize(ciphertext).map { |letter| translate(letter, ALPHABET.reverse) }.join('')
    end
  
    def self.sanitize(string)
      string.downcase.gsub(/[^a-z0-9]/, '').split('')
    end
  
    def self.translate(letter, key)
      key.include?(letter) ? key.reverse[key.index(letter)] : letter
    end
  end