=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end
class Microwave
  
    def initialize(time)
      @time = time
    end
  
    def timer
      seconds = @time.to_s
      
      case seconds.length
      when 1 then "00:0#{seconds}"
      when 2
        if @time == 60
          "01:00"
        elsif @time < 60
          "00:#{seconds}"
        else
          @time % 60 > 9 ? "0#{@time / 60}:#{@time % 60}" : "0#{@time / 60}:0#{@time % 60}"
        end
      when 3
        if seconds[1].to_i < 6
          "0#{seconds[0]}:#{seconds[1..2]}"
        else 
          "0#{(@time + 100).to_s[0]}:#{(@time - 60).to_s[1..2]}"
        end
      when 4
          seconds[1] += ":"
          seconds
      end
    end
  end