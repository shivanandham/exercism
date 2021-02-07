=begin
Write your code for the 'Binary Search Tree' exercise in this file. Make the tests in
`binary_search_tree_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search-tree` directory.
=end

class Bst
    attr_accessor :data, :right, :left
    def initialize(input)
        @data = input
        @right = nil
        @left = nil
        @datas = [@data]
    end
    def insert(input)
        @datas << input
        if input > data
            right ? right.insert(input) : self.right = Bst.new(input)
        else
            left ? left.insert(input) : self.left = Bst.new(input)
        end
    end
    def each(&block)
        return enum_for(:each) unless block_given?
        all_datas = []
        @datas.sort.each do |e|
            all_datas << block.call(e)
        end
        all_datas
    end
end