=begin
Write your code for the 'Meetup' exercise in this file. Make the tests in
`meetup_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/meetup` directory.
=end

require 'date'

class Meetup
  def initialize month, year
    @date = Date.new year, month, 1
  end

  def day meetup_day, which
    date = @date.dup
    until right_day? date, meetup_day, which
      date = date.next
    end
    date
  end

  private

  def right_day? date, meetup_day, which
    return false unless day_name(date) == meetup_day

    case which
    when :teenth
      date.day.between?(13, 19)
    when :first
      true
    when :second
      date.day.between?(8, 14)
    when :third
      date.day.between?(15, 21)
    when :fourth
      date.day.between?(22, 28)
    when :last
      date.next_day(7).month != date.month
    end
  end

  def day_name date
    {
      1 => :monday,
      2 => :tuesday,
      3 => :wednesday,
      4 => :thursday,
      5 => :friday,
      6 => :saturday,
      7 => :sunday
    }[date.cwday]
  end
end