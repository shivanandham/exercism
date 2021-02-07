=begin
Write your code for the 'Custom Set' exercise in this file. Make the tests in
`custom_set_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/custom-set` directory.
=end

class CustomSet
    def initialize(values)
        @values = values.uniq
    end

    def empty?
        values.empty?
    end

    def member?(element)
        values.include?(element)
    end

    def subset?(other)
        difference(other).empty?
    end

    def disjoint?(other)
        intersection(other).empty?
    end

    def ==(other)
        return false unless other.kind_of?(CustomSet)

        values.sort == other.values.sort
    end

    def add(element)
        values << element unless values.include?(element)
        self
    end

    def intersection(other)
        CustomSet.new(values & other.values)
    end

    def difference(other)
        CustomSet.new(values - other.values)
    end

    def union(other)
        CustomSet.new(values + other.values)
    end

    protected

    attr_reader :values
end