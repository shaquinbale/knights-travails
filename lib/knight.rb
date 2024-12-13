class Knight
  attr_reader :position
  attr_accessor :parent, :children

  KNIGHT_MOVES = [ # An array of possible [row, column] transformations for potential moves
    [2, 1], [2, -1], # Up 2, left/right 1
    [-2, 1], [-2, -1], # Down 2, left/right 1
    [1, 2], [-1, 2], # Right 2, up/down 1
    [1, -2], [-1, -2]  # Left 2, up/down 1
  ].freeze

  def initialize(position, parent=nil) 
    @position = position # All positions in this project will be an array of two ints between 0 and 7 (i.e. [2, 4])
    @parent = parent
    @children = []
  end

  def valid_moves(position=@position)
    x, y = position
    moves = KNIGHT_MOVES.map { |dx, dy| [x + dx, y + dy] }
    moves.select { |nx, ny| nx.between?(0, 7) && ny.between?(0, 7) }
  end

  def generate_children
    @children = valid_moves.each { |move| Knight.new(move, self) }
  end
end