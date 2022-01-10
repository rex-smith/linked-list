class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if !@head
      @head = new_node
    elsif !@tail
      @tail = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size
    counter = 0
    current_node = @head
    while current_node != nil
      current_node = current_node.next_node
      counter += 1
    end
    counter
  end

  # Head and Tail functions are included using attr_accessor

  def at(index)
    current_node = @head
    i = 0;
    while i<= index
      current_node = current_node.next_node
      i += 1
    end
    current_node
  end

  def pop
    current_node = @head
    previous_node = nil
    until current_node == nil
      previous_node = current_node
      current_node = current_node.next_node
    end
    @tail = previous_node
    @tail.next_node = nil
  end

  def contains?(value)
    contains = false
    current_node = @head
    while current_node != nil
      if current_node.data == value
        contains = true
      end
    end
    contains
  end

  def find(value)
    counter = 0
    current_node = @head
    while current_node != nil
      counter += 1
      if current_node.data == value
        return counter
      end
    end
    return nil
  end

  def to_s
    current_node = @head
    linked_string = ''
    while current_node != nil
      linked_string = linked_string + "( #{current_node.value} ) -> "
    end
    linked_string = linked_string + current_node
    linked_string
  end

  def insert_at(value, index)
    
    # Initialize new node
    new_node = Node.new(value)
    # Find the index
    current_node = @head
    previous_node = nil
    index.times do 
      previous_node = current_node
      current_node = current_node.next_node
    end
    
    # Make previous item's next_node equal to the new node 
    # and the new node's next_node equal to the previous next node
    new_node.next_node = current_node
    previous_node.next_node = new_node

  end

  def remove_at(index)
    # Find the index
    # Make previous node's next node equal to the current node's next node
    current_node = @head
    previous_node = nil
    index.times do 
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = current_node.next_node
  end
end

class Node
  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end
  attr_accessor :data, :next_node
end


# TESTING

list = LinkedList.new()
# puts list
list.append('last')
# puts list
list.prepend('first')
puts list
puts "Size: #{list.size}"
puts "Head: #{list.head.value}"
puts "Tail: #{list.tail.value}"
puts "At 1: #{list.at(1).value}"
list.pop
puts list
puts "Contains 'first': #{list.contains?('first')}"
puts "Contains 'last': #{list.contains?('last')}"
puts "Index of 'first': #{list.find('first')}"
list.insert_at('new_first', 0)
list.insert_at('new_last', 2)
puts list
list.remove_at(1)
puts list