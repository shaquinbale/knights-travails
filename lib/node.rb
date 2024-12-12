class Node
  attr_accessor :value, :edges

  def initialize(value)
    @value = value
    @edges = []
  end

  def connect(node)
    @edges << node
  end
end