=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end

class TwelveDays
    class << self
      def song
        song = ""
  
        GIFTS.each_with_index do |gift, down_from|
          giftlist = get_giftlist(down_from)
  
          song << "On the #{gift.day} day of Christmas my true love gave to me: #{giftlist}\n\n"
        end
  
        # You have no idea how long it took me to realize that the test was failing
        # because of an extra newline character
        song.chop!
      end
  
      private
  
      Gift = Struct.new(:day, :gift)
  
      GIFTS = [
        Gift["first",   "a Partridge in a Pear Tree"],
        Gift["second",  "two Turtle Doves"],
        Gift["third",   "three French Hens"],
        Gift["fourth",  "four Calling Birds"],
        Gift["fifth",   "five Gold Rings"],
        Gift["sixth",   "six Geese-a-Laying"],
        Gift["seventh", "seven Swans-a-Swimming"],
        Gift["eighth",  "eight Maids-a-Milking"],
        Gift["ninth",   "nine Ladies Dancing"],
        Gift["tenth",   "ten Lords-a-Leaping"],
        Gift["eleventh","eleven Pipers Piping"],
        Gift["twelfth", "twelve Drummers Drumming"]].freeze
  
      def get_giftlist(down_from)
        giftlist = ""
  
        down_from.downto(0) do |day|
          gift_of_the_day = GIFTS[day].gift
  
          giftlist << gift_of_the_day
          giftlist << (day.eql?(0) ? "." :
                       day.eql?(1) ? ", and " : ", ")
        end
  
        giftlist
      end
    end
  end