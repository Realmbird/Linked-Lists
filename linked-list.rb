class Node
  attr_accessor :value, :next_node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize(value = nil, next_node = nil)
    @head = Node.new(@value, @next_node)
  end

  # Traversing List
  def loop 
    Node temporary = @head
    while(temporary != nil && temporary.value != nil)
      temporary = temporary.next_node
    end
    temporary
  end
  def append(value)
    Node temporary = loop
    temporary.next_node = Node.new(value)
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end
  def size
    s = 0
    Node temporary = @head
    while(temporary != nil && temporary.value != nil)
      temporary = temporary.next_node
      s += 1
    end
    s
  end

  def tail
    loop
  end

  def at(index)
    Node temporary = @head
    i = 0
    while(temporary != nil && temporary.value != nil && i < index)
      temporary = temporary.next_node
      i += 1
      s += 1
    end
    temporary
  end

  def pop
    Node temporary = @head
    while(temporary != nil && temporary.value != nil)
      prev = temporary
      temporary = temporary.next_node
    end
    prev.next_node = nil
  end

  def contains?(value)
    contain = false
    Node temporary = @head
    while(temporary != nil && temporary.value != nil)
      if(temporary.value == value)
        contain = true
      end
      temporary = temporary.next_node
    end
    contain
  end

  def find(value)
    Node temporary = @head
    i = 0
    while(temporary != nil && temporary.value != nil)
      
      if(temporary.value == value)
        return i
      end
      i += 1
      temporary = temporary.next_node
    end
    return nil
  end

  def to_s
    string = ""
    Node temporary = @head
    while(temporary != nil && temporary.value != nil)
      string += "#{temporary.value} ->"
      temporary = temporary.next_node
    end
    string += "#{nil}"
    return string
  end

  # Extra Credit

  def insert_at(value, index)

  end

  def remove_at(index)

  end
end

link = LinkedList.new(5)
puts link.to_s