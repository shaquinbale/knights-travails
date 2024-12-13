require_relative 'knight'

class Logic
  def knight_moves(current_position, destination)
    # Move validation and edge cases
    puts "Invalid input, try again" unless valid_position?(current_position) && valid_position?(destination)
    puts "Already at destination" if current_position == destination

    destination_node = move_search(current_position, destination)
    moves = moves_to_parent(destination_node, current_position)

    puts "You made it in #{moves.length} moves! Here's your path:"
    p current_position
    moves.each { |move| p move}
  end

  private

  def valid_position?(pos)
    pos.is_a?(Array) &&  pos.size == 2 && pos.all? { |n| n.between?(0, 7) }
  end

  # Returns a child node at the position of the destination with corresponding history
  def move_search(position, destination)
    queue = [Knight.new(position)]
    visited = []

    until queue.empty?   
      current_node = queue.shift
      next if visited.include? current_node.position

      visited << current_node.position
      return current_node if current_node.position == destination
      
      current_node.generate_children
      current_node.children.each { |child| queue << child }
    end
  end

  # Takes a child node and traverse its parents to return the moves to get there
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