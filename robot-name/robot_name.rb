=begin
Write your code for the 'Robot Name' exercise in this file. Make the tests in
`robot_name_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/robot-name` directory.
=end

class Robot
    attr_reader :name
  
    def self.forget
      @@names = ('AA000'..'ZZ999').to_a.shuffle
    end
  
    def initialize
      reset
    end
  
    def reset
      @name = @@names.pop
    end
  end