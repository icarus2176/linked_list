class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value, @next_node = value, next_node
  end
end