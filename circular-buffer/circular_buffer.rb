=begin
Write your code for the 'Circular Buffer' exercise in this file. Make the tests in
`circular_buffer_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/circular-buffer` directory.
=end

class CircularBuffer
  
    class BufferEmptyException < Exception; end
    class BufferFullException < Exception; end
  
    def initialize(length)
      @length = length
      @buffer = []
    end
  
    def write(element)
      raise BufferFullException.new if full?
      @buffer << element
    end
  
    def write!(element)
      read if full?
      write(element)
    end
  
    def read
      raise BufferEmptyException.new if @buffer.empty?
      @buffer.shift 
    end
  
    def clear
      @buffer.clear
    end
  
    private
  
    def full?
      @buffer.length == @length
    end
  end