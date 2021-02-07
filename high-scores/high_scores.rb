=begin
Write your code for the 'High Scores' exercise in this file. Make the tests in
`high_scores_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/high-scores` directory.
=end

class HighScores
    attr_reader :scores, :latest, :personal_best
    def initialize(scores)
      @scores = scores
      @latest = scores[-1]
      @personal_best = scores.max
    end
  
    def personal_top_three
      toptree = @scores.sort.reverse.slice(0, 3)
    end
  
    def latest_is_personal_best?
      personal_top_three[0] > @scores[-1]? false : true
    end
  end