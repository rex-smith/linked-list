class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)

    if !@head
      puts "Head was nil"
      @head = new_node
    elsif !@tail
      puts "Tail was nil, not head"
      @tail = new_node
      @head.next_node = @tail
    else
      puts "Neither Nil"
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    if !@tail
      @tail = @head
    end
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
    while i < index
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
      current_node = current_node.next_node
    end
    contains
  end

  def find(value)
    counter = 0
    current_node = @head
    while current_node != nil
      if current_node.data == value
        return counter
      end
      counter += 1
    end
    return nil
  end

  def to_s
    current_node = @head
    linked_string = ''
    while current_node != nil
      linked_string = linked_string + "( #{current_node.data} ) -> "
      current_node = current_node.next_node
    end
    linked_string = linked_string + "nil"
    linked_string
  end

  def insert_at(value, index)
    
    # Initialize new node
    new_node = Node.new(value)
    # Find the index
    if index == 0
      prepend(value)
      return
    end
    current_node = @head
    previous_node = nil
    counter = 1
    while counter <= index
      previous_node = current_node
      current_node = current_node.next_node
      counter +=1
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
puts "SIMPLE TESTING"
list = LinkedList.new()
puts list
list.append('last')
puts list
list.prepend('first')
puts list
puts "Size: #{list.size}"
puts "Head: #{list.head.data}"
puts "Tail: #{list.tail.data}"
puts "At 1: #{list.at(1).data}"
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
puts

# ADVANCED TESTING
puts "ADVANCED TESTING"
adList = LinkedList.new()
adList.prepend('boylston')
puts adList
adList.prepend('weymouth')
puts adList
adList.append('peabody')
puts adList
adList.insert_at('brookline', 2)
puts adList
adList.remove_at(1)
puts adList
adList.append('quincy')
adList.append('worcester')
adList.prepend('manchester')
puts adList
puts "Size: #{adList.size}"
puts "Head: #{adList.head.data}"
puts "Tail: #{adList.tail.data}"