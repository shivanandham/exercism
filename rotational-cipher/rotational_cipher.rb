=begin
Write your code for the 'Rotational Cipher' exercise in this file. Make the tests in
`rotational_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rotational-cipher` directory.
=end

class RotationalCipher

    ALPHABETS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  
    def self.rotate(not_encrypted_str, key)
      encrypted_str = ""
      not_encrypted_str.chars do |char|
        if char =~ /[a-zA-Z]{1}/
          big = false
          big = true  if char =~ /[A-Z]{1}/
          char = char.downcase if big == true
  
          new_key = ALPHABETS.find_index(char) + key
          new_key -= 26 if new_key >= 26
          big == true ? add_str = ALPHABETS[new_key].upcase : add_str = ALPHABETS[new_key]
        else
          add_str = char
        end
        encrypted_str += "#{add_str}"
      end
      encrypted_str
    end
  
  end