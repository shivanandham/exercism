=begin
Write your code for the 'Simple Linked List' exercise in this file. Make the tests in
`simple_linked_list_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/simple-linked-list` directory.
=end

class SimpleLinkedList

    def initialize(elements=[])
        elements.each { |element| push(Element.new(element)) }
    end

    def push(element)
        element.next = @tail
        @tail = element
        self
    end

    def pop
        oldest = @tail
        @tail = oldest.next unless @tail.nil?
        oldest
    end

    def reverse!
        return self if @tail.nil?

        previous = @tail
        current = @tail.next
        @tail.next = nil
        until current.nil?
            tmp = current.next
            current.next = previous
            previous = current
            current = tmp
        end
        @tail = previous
        
        self
    end

    def to_a
        result = []
        current = @tail
        until current.nil?
            result << current.datum
            current = current.next
        end
        result
    end
end

class Element
    attr_reader :datum
    attr_accessor :next

    def initialize(datum)
        @datum = datum
    end
end