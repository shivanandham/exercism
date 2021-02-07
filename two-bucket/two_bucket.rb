=begin
Write your code for the 'Two Bucket' exercise in this file. Make the tests in
`two_bucket_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/two-bucket` directory.
=end

class TwoBucket
    attr_reader :moves, :goal_bucket, :other_bucket
  
    def initialize(one_cap, two_cap, target, fill_first)
      first = Bucket.new("one", one_cap)
      second = Bucket.new("two", two_cap)
      first, second = second, first if fill_first == "two"
  
      @moves = 0
  
      while [first, second].none? { |b| b.liter == target }
        @moves += 1
  
        if first.empty?
          first.fill!
        elsif second.cap == target
          second.fill!
        elsif second.full?
          second.empty!
        else
          transfer = [first.liter, second.remaining].min
          first.remove(transfer)
          second.add(transfer)
        end
      end
  
      if first.liter == target
        @goal_bucket = first.label
        @other_bucket = second.liter
      else
        @goal_bucket = second.label
        @other_bucket = first.liter
      end
    end
  
    private
  
    class Bucket
      attr_reader :liter, :cap, :label
  
      def initialize(label, cap)
        @label = label
        @cap = cap
        @liter = 0
      end
  
      def empty?
        @liter == 0
      end
  
      def full?
        @liter == @cap
      end
  
      def empty!
        @liter = 0
      end
  
      def fill!
        @liter = @cap
      end
  
      def remaining
        @cap - @liter
      end
  
      def add(transfer)
        @liter += transfer
      end
  
      def remove(transfer)
        @liter -= transfer
      end
    end
  end