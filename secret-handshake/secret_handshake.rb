=begin
Write your code for the 'Secret Handshake' exercise in this file. Make the tests in
`secret_handshake_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/secret-handshake` directory.
=end

class SecretHandshake
    COMMANDS = %w[wink double-blink close-your-eyes jump]
  
    def initialize(number)
      @number = number
    end
  
    def commands
      return [] unless @number.is_a?(Integer)
  
      binary_string = @number.to_s(2)
      output = []
      binary_string.chars.reverse.each_with_index do |binary, index|
        if index >= COMMANDS.length
          output.reverse!
          break
        end
        output << COMMANDS[index].tr('-', ' ') if binary == '1'
      end
      output
    end
  end