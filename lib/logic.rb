require_relative 'knight'

class Logic
  def knight_moves(current_position, destination)
    destination_node = move_search(current_position, destination)
    moves = moves_to_parent(destination_node, current_position)

    puts "You made it in #{moves.length} moves! Here's your path:"
    p current_position
    moves.each { |move| p move}
  end

  # Returns a node at the position of the destination with corresponding history
  def move_search(position, destination)
    queue = [Knight.new(position)]
    visited = []

    until queue.empty?   
      current_node = queue.shift
      next if visited.include? current_node.position
      return current_node if current_node.position == destination
      
      current_node.generate_children
      current_node.children.each { |child| queue << child }
    end
  end

  def moves_to_parent(child_node, parent_pos)
      history = []
      current_node = child_node
      until current_node.position == parent_pos
        history.unshift current_node.position
        current_node = current_node.parent
      end
      history
  end
end