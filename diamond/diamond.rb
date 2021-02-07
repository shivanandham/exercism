=begin
Write your code for the 'Diamond' exercise in this file. Make the tests in
`diamond_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/diamond` directory.
=end

module Diamond

    private
  
    def self.units_between(letter)
      (letter.ord - "B".ord) * 2 + 1
    end
  
    def self.row_width(letter)
      2 + units_between(letter)
    end
  
    def self.units_outside(letter, max_width)
      (max_width - 2 - units_between(letter)) / 2
    end
    
    def self.row(letter, max_width)
      format_row(
        letter,
        units_between(letter),
        units_outside(letter, max_width),
        max_width
      )
    end
  
    def self.format_row(letter, inners, outers, max_width)
      letter == "A" ?
        "#{' ' * ((max_width - 1) / 2)}A#{' ' * ((max_width - 1) / 2)}\n" :
        "#{' ' * outers}#{letter}#{' ' * inners}#{letter}#{' ' * outers}\n"
    end
    
    public
  
    def self.make_diamond(letter)
      top = ("A"...letter).map { |l| row(l, row_width(letter)) }
      middle = [format_row(letter, units_between(letter), 0, row_width(letter))]
      bottom = top.reverse
      ( top + middle + bottom ).join
    end
  
  end