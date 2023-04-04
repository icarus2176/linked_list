class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value, @next_node = value, next_node
  end
end

class LinkedList
  def initialize(head = nil)
    @head = head
  end

  def head
    @head
  end

  def next

  end

  def tail
    node = @head

   while node.next_node
      node = node.next_node
    end
    node 
  end

  def size
    length = 1
    node = @head

    while node.next_node
      length += 1
      node = node.next_node
    end
    length
  end

  def prepend(value)
    node = Node.new(value, @head)
    @head = node
  end

  def append(value)
    node = Node.new(value)
    tail = self.tail
    tail.next_node = node
  end

  def at(index)
    node = @head

    for i in 1 .. index
      node = node.next_node
    end
    node
  end

  def pop
    node = @head

    for i in 1 .. (self.size - 2)
      node = node.next_node
    end
    node.next_node = nil
  end

  def contains?(value)
    node = @head

    while node.next_node
      node = node.next_node
      return true if node.value == value
    end

    false
  end

  def find(value)
    node = @head

    while node.next_node
      node = node.next_node
      return node if node.value == value
    end

    nil
  end

  def to_s
    string = "( #{@head.value} ) -> "

    node = @head

    while node.next_node
      node = node.next_node
      string += "( #{node.value} ) -> "
    end
    string += "nil"
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    node = @head

    for i in 1 .. index - 1
      node = node.next_node
    end
    new_node.next_node = node.next_node
    node.next_node = new_node
  end

  def remove_at(index)
    node = @head

    for i in 1 .. index - 1
      node = node.next_node
    end

    node.next_node = node.next_node.next_node
  end
end

node = Node.new("a")
list = LinkedList.new(node)
list.prepend(" ")

list.append("b")
list.append("c")

list.pop

list.insert_at("1", 2)
list.remove_at(2)
puts list.to_s