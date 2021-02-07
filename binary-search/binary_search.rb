=begin
Write your code for the 'Binary Search' exercise in this file. Make the tests in
`binary_search_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search` directory.
=end

class BinarySearch
    def initialize(array)
      @array = array
    end
  
    def search_for(number, first = 0, last = @array.length)
      return nil if first == last
  
      middle_index = (last + first) / 2
      middle = @array[middle_index]
  
      if middle == number
        return middle_index
      elsif middle > number
        search_for(number, first, middle_index)
      else
        search_for(number, middle_index + 1, last)
      end
    end
  end