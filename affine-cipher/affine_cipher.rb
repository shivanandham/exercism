=begin
Write your code for the 'Affine Cipher' exercise in this file. Make the tests in
`affine_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/affine-cipher` directory.
=end

class Affine
    ALPHABET = ('a'..'z').to_a.freeze
    ALPHABET_SIZE = ALPHABET.length
    private_constant :ALPHABET, :ALPHABET_SIZE
        
    def initialize(a, b)
        raise ArgumentError unless a.gcd(ALPHABET_SIZE) == 1
        @a = a
        @b = b
        @a_inv = (0...ALPHABET_SIZE).detect { |n| (a * n) % ALPHABET_SIZE == 1 }
    end

    def encode(plaintext)
        plaintext
            .each_char
            .map(&:downcase)
            .filter { |letter| letter.match? /[\w\d]/ }
            .map { |letter| encoded_letter(letter) }
            .each_slice(5)
            .map(&:join)
            .join(' ')
    end

    def decode(chipertext)
        chipertext
            .delete(' ')
            .each_char
            .map { |encoded_letter| decode_letter(encoded_letter) }
            .join  
    end

    private

    attr_reader :a, :a_inv, :b

    def decode_letter(encoded_letter)
        return encoded_letter if encoded_letter.match?(/\d/)

        encoded_letter_index = ALPHABET.index(encoded_letter)
        decoded_letter_index = (a_inv * (encoded_letter_index - b)).modulo(ALPHABET_SIZE)
        ALPHABET[decoded_letter_index]
    end

    def encoded_letter(letter)
        letter_index = ALPHABET.index(letter)

        return letter if letter_index.nil?
        
        encoded_letter_index = (a * letter_index + b).modulo(ALPHABET_SIZE)
        ALPHABET[encoded_letter_index]
    end
end