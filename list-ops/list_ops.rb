=begin
Write your code for the 'List Ops' exercise in this file. Make the tests in
`list_ops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/list-ops` directory.
=end

module ListOps
    # What is the difference between a value of nil and an index that is not set?
    # As long as I don't know that I can't make the .length method from scratch.
    def self.arrays(array)
      array.size
    end
  
    def self.reverser(array)
      reversed_array = []
      for i in 0...array.length do 
        reversed_array << array.pop
      end
      reversed_array
    end
  
    def self.concatter(input1, input2)
      for i in 0...input2.length do
        input1 << input2.shift
      end
      input1
    end
  
    def self.mapper(array) 
      result = []
      for i in 0...array.length
        result << yield(array[i])
      end
      result
    end
  
    def self.filterer(array, &block)
      result = []
      for i in 0...array.length
        result << array[i] if yield(array[i])
      end
      result
    end
  
    def self.sum_reducer(array)
      sum = 0
      while array != [] do
        sum += array.pop.to_i
      end
      sum
    end
  
    def self.factorial_reducer(array)
      factorial = 1
      while array != [] do
        factorial *= array.pop.to_i
      end
      factorial
    end
  end