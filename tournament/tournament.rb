=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

class Team
    WIN_POINTS = 3
    DRAW_POINTS = 1
  
    attr_reader :name
  
    def initialize(name)
      @name = name
      @wins = 0
      @loses = 0
      @draws = 0
    end
  
    def matches
      @wins + @loses + @draws
    end
  
    def points
      @wins * WIN_POINTS + @draws * DRAW_POINTS
    end
  
    def info
      [@name, matches, @wins, @draws, @loses, points]
    end
  
    def won
      @wins += 1
    end
  
    def lost
      @loses += 1
    end
  
    def tied
      @draws += 1
    end
  end
  
  class Tournament
    REPORT_HEADER = %w[Team MP W D L P].freeze
    REPORT_FORMAT = "%-31s| %2s |  %s |  %s |  %s |  %s\n".freeze
  
    def self.tally(input)
      new(input).report
    end
  
    def initialize(input)
      @teams = Hash.new { |hash, key| hash[key] = Team.new(key) }
      lines = input.split("\n")
      lines.each { |line| parse(line) }
    end
  
    def report
      REPORT_FORMAT % REPORT_HEADER +
        @teams.values
              .sort_by { |team| [-team.points, team.name] }
              .map { |team| REPORT_FORMAT % team.info }
              .join
    end
  
    private
  
    def parse(line)
      team1, team2, result = line.split(';')
      case result
      when 'win'
        @teams[team1].won
        @teams[team2].lost
      when 'loss'
        @teams[team1].lost
        @teams[team2].won
      when 'draw'
        @teams[team1].tied
        @teams[team2].tied
      end
    end
  end