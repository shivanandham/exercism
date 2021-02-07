=begin
Write your code for the 'Complex Numbers' exercise in this file. Make the tests in
`complex_numbers_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/complex-numbers` directory.
=end

class ComplexNumber
    attr_reader :real, :imaginary
  
    def initialize real, imaginary
      @real = real.to_f
      @imaginary = imaginary.to_f
    end
  
    def + other
      self.class.new(
        real + other.real,
        imaginary + other.imaginary
      )
    end
  
    def - other
      self.class.new(
        real - other.real,
        imaginary - other.imaginary
      )
    end
  
    def * other
      self.class.new(
        real * other.real - imaginary * other.imaginary,
        real * other.imaginary + imaginary * other.real
      )
    end
  
    def / other
      self.class.new(
        (real * other.real + imaginary * other.imaginary) / (other.real ** 2 + other.imaginary ** 2),
        (imaginary * other.real - real * other.imaginary) / (other.real ** 2 + other.imaginary ** 2)
      )
    end
  
    def abs
      Math.sqrt(real ** 2 + imaginary ** 2)
    end
  
    def conjugate
      self.class.new(real, -imaginary)
    end
  
    def exp
      self.class.new(Math.exp(real), 0) * self.class.new(Math.cos(imaginary), Math.sin(imaginary))
    end
  
    def == other
      (real - other.real).abs < 1e-9 && (imaginary - other.imaginary).abs < 1e-9
    end
  end