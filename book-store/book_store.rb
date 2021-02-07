=begin
Write your code for the 'Book Store' exercise in this file. Make the tests in
`book_store_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/book-store` directory.
=end

module BookStore
    PRICE = 8
    DISCOUNTS = {
      2 => 0.05,
      3 => 0.1,
      4 => 0.2,
      5 => 0.25
    }
  
    def self.calculate_price(basket)
      return 0.0 if basket.empty?
      price(optimize(transpose(basket)))
    end
  
    def self.price(sets)
      sets.sum { |set| set.size * PRICE * (1.0 - (DISCOUNTS[set.length] || 0)) }
    end
  
    def self.optimize(sets)
      while suboptimal?(sets)
        shift = sets.reject { |set| set.size == 4 }.max_by(&:size).pop
        sets.select { |set| set.size < 4 }.max_by(&:size).push(shift)
      end
      sets
    end
  
    def self.suboptimal?(sets)
      (sets.any? { |set| set.size == 3 } &&
        sets.any? { |set| set.size == 5 }) ||
        sets.select { |set| set.size == 3 }.count > 1
    end
  
    def self.transpose(nums)
      duplicates = nums.sort.chunk_while { |a, b| a == b }
      max_col = duplicates.map(&:length).max - 1
      (0..max_col).each_with_object([]) do |col, result|
        result << duplicates.map { |dup| dup[col] }.compact
      end
    end
  end