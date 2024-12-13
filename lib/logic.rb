require_relative 'knight'

class Logic
  
end

=begin 

def knight_moves(current_position, destination)
  destination_node = move_search(current_position, destination)
  moves_to_parent(destination_node, current_position)



def move_search(position, destination)
  initialize and queue a knight node at position
  queue = []
  visited = []

  until queue.empty?
    dequeue a node and check it. return node if #position == destination
    queue its #generate_children
  end

  raise error: move not found
end

def moves_to_parent(child_node, parent_pos)
  history = []
  current_node = child_node
  until child_node.position == parent_pos
    history << current_node.position
    current_node = current_node.parent
=end