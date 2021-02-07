=begin
Write your code for the 'Allergies' exercise in this file. Make the tests in
`allergies_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/allergies` directory.
=end

class Allergies
    ALLERGIES = %w{
      eggs
      peanuts
      shellfish
      strawberries
      tomatoes
      chocolate
      pollen
      cats
    }.freeze
  
    private_constant :ALLERGIES
  
    def initialize(score)
      @score = score.digits(2)
    end
  
    def allergic_to?(allergy)
      @score[ALLERGIES.index(allergy)] == 1
    end
  
    def list
      ALLERGIES.select(&method(:allergic_to?))
    end
  end