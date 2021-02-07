=begin
Write your code for the 'Linked List' exercise in this file. Make the tests in
`linked_list_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/linked-list` directory.
=end

class Deque
    def initialize
      @head = nil
      @tail = nil
    end
  
    def unshift(value)
      new_node = Node.new(value, next_node: head)
      head.previous = new_node unless head.nil?
      @head = new_node
      @tail ||= head
    end
  
    def push(value)
      new_node = Node.new(value, previous: tail)
      tail.next = new_node unless tail.nil?
      @tail = new_node
      @head ||= tail
    end
  
    def pop
      return nil if tail.nil?
  
      value = tail.value
      @tail = tail.previous
      @head = nil if tail.nil?
      value
    end
  
    def shift
      return nil if head.nil?
  
      value = head.value
      @head = head.next
      @tail = nil if head.nil?
      value
    end
  
    private
  
    attr_reader :head, :tail
  
    class Node
      attr_reader :value
      attr_accessor :previous, :next
  
      def initialize(value, previous: nil, next_node: nil)
        @value = value
        @previous = previous
        @next = next_node
      end
    end
  end