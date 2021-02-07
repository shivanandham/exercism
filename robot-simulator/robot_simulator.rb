=begin
Write your code for the 'Robot Simulator' exercise in this file. Make the tests in
`robot_simulator_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/robot-simulator` directory.
=end

class Robot
    STEPS = {
      north: [0, 1],
      east: [1, 0],
      south: [0, -1],
      west: [-1, 0],
    }.freeze
    BEARINGS = STEPS.keys.freeze
  
    private_constant :STEPS, :BEARINGS
    attr_reader :coordinates
  
    def orient(direction)
      raise ArgumentError unless BEARINGS.include?(direction)
  
      @direction = BEARINGS.index(direction)
    end
  
    def bearing
      BEARINGS[@direction]
    end
  
    def turn_right
      @direction = (@direction + 1) % BEARINGS.length
    end
  
    def turn_left
      @direction = (@direction - 1) % BEARINGS.length
    end
  
    def at(*coordinates)
      @coordinates = coordinates
    end
  
    def advance
      step = STEPS[self.bearing]
      @coordinates = [
        @coordinates.first + step.first,
        @coordinates.last + step.last,
      ]
    end
  end
  
  class Simulator
    INSTRUCTIONS = {
      "L" => :turn_left,
      "R" => :turn_right,
      "A" => :advance,
    }
  
    private_constant :INSTRUCTIONS
  
    def instructions(instructions)
      instructions
        .each_char
        .map { |instuction| INSTRUCTIONS[instuction] }
    end
  
    def place(robot, x:, y:, direction:)
      robot.at(x, y)
      robot.orient(direction)
    end
  
    def evaluate(robot, raw_instructions)
      instructions(raw_instructions).each do |instruction|
        robot.send(instruction)
      end
    end
  end