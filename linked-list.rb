class Node
  attr_accessor :value, :next_node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    "Node with value: #{@value}"
  end
end

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def append(value)
    if head.nil?
      set_head(value)
    else
      temp = @head
      # traverse list checks if next node is nil; when it is it ends the loop
      temp = temp.next_node until temp.next_node.nil?
      # no error just no assignment
      temp.next_node = create_node(value)
      # gives error temp.next_node = create_node(value)
    end
  end

  def prepend(value)
    if head.nil?
      set_head(value)
    else
      @head = Node.new(value, head)
    end
  end

  def size
    return 0 if head.nil?

    temp = @head
    # starts at one because you need to include the first node
    size = 1
    until temp.next_node.nil?
      size += 1
      temp = temp.next_node
    end
    size
  end

  def create_node(value = nil, next_node = nil)
    Node.new(value, next_node)
  end

  def set_head(value)
    self.head = create_node(value)
  end

  def tail
    temp = @head
    temp = temp.next_node until temp.next_node.nil?
    temp
  end

  def at(index)
    return head if index.zero?

    temp = @head
    i = 0
    until temp.next_node.nil?
      temp = temp.next_node
      i += 1
      return temp if index == i
    end
    nil
  end

  def contains?(value)
    temp = @head
    until temp.next_node.nil?
      return true if temp.value == value

      temp = temp.next_node
    end
    false
  end

  def find(value)
    return nil unless contains?(value)

    index = 0
    temp = @head
    until temp.next_node.nil?
      return index if temp.value == value

      index += 1
      temp = temp.next_node
    end
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?

    temp = at(index - 1)
    return 'invalid' if temp.nil?

    temp.next_node = Node.new(value, at(index))
  end

  def remove_at(index)
    return @head = @head.next_node if index.zero?

    temp = at(index - 1)
    return temp.next_node = nil if at(index) == tail

    temp.next_node = at(index + 1)
  end

  def pop
    temp = @head
    temp = temp.next_node until temp.next_node == tail
    temp.next_node = nil
  end

  def to_s
    if head.nil?
      puts 'No linked list'
    else
      temp = head
      list = ''
      # traverse list
      until temp.nil?
        list += "(#{temp.value}) -> "
        temp = temp.next_node
      end
      list += 'nil'
      list
    end
  end
end

link = LinkedList.new
link.append('test1')
link.append('test2')
link.append('test3')
p link.to_s
link.prepend('hi')
p link.to_s
puts link.size
puts link.head
puts link.tail
puts link.at(2)
puts link.pop
puts link.to_s
puts link.contains?('test1')
puts link.find('test1')
link.insert_at('test3', 2)
link.insert_at('test4', 1)
link.insert_at('test5', 0)
puts link.to_s
link.remove_at(0)
puts link.to_s
link.remove_at(2)
puts link.to_s
link.remove_at(3)
puts link.to_s