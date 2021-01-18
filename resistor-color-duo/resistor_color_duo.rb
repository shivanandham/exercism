=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-duo` directory.
=end

class ResistorColorDuo
    def self.value values
        color_code = ["black", "brown", "red","orange",
            "yellow", "green", "blue", "violet", "grey", "white"]
            (color_code.find_index(values[0]) * 10) + (color_code.find_index(values[1]) )
    end
end