=begin
Write your code for the 'Rail Fence Cipher' exercise in this file. Make the tests in
`rail_fence_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/rail-fence-cipher` directory.
=end

class RailFenceCipher
    class << self
      def encode(message, rails)
        new(message, rails).encode
      end
  
      def decode(message, rails)
        new(message, rails).decode
      end
    end
  
    attr_reader :message, :rails_number
  
    def initialize(message, rails_number)
      @message = message
      @rails_number = rails_number
    end
  
    def encode
      rails = rails_number.times.with_object([]) { |_, memo| memo << [] }
  
      message.length.times do |index|
        rails[iterator.next] << message[index]
      end
  
      rails.join
    end
  
    def decode
      original_rails = rails_number.times.with_object([]) do |_, memo|
        memo << Array.new(message.length)
      end
  
      message.each_char.with_index do |_, index|
        original_rails[iterator.next][index] = true
      end
  
      message_iterator = message.each_char
  
      original_rails.each_with_index do |rail, rail_index|
        rail.each_with_index do |r, index|
          original_rails[rail_index][index] = message_iterator.next if r
        end
      end
  
      iterator.rewind
  
      message.length.times.with_object("") do |index, original|
        original << original_rails[iterator.next][index]
      end
    end
  
    private
  
    def iterator
      @iterator ||= begin
          array = (0...rails_number).to_a
          array.concat((1..(rails_number - 2)).to_a.reverse)
          array.cycle
        end
    end
  end