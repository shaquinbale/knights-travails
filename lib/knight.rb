require_relative 'node'

class Knight
  attr_reader :position
  attr_accessor :parents, :children

  @@KNIGHT_MOVES = [ # An array of possible [row, column] transformations for potential moves
    [2, 1], [2, -1], # Up 2, left/right 1
    [-2, 1], [-2, -1], # Down 2, left/right 1
    [1, 2], [-1, 2], # Right 2, up/down 1
    [1, -2], [-1, -2]  # Left 2, up/down 1
  ]

  def initialize(position)
    @position = position # A array of two integers (i.e. [2, 4])
    @parents = []
    @children = []
  end

  def valid_moves(position=@position)
    x, y = position
    moves = @@KNIGHT_MOVES.map { |dx, dy| [dx += x, dy += y] }
    moves.select { |nx, ny| nx.between?(0, 7) && ny.between?(0, 7) }
  end

  def generate_children
    valid_moves.each { |move| @children << Knight.new(move) }
  end
end

