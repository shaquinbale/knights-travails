class Knight
  @@KNIGHT_MOVES = [ # An array of [row, column] transformations
    [2, 1], [2, -1], # Up 2, left/right 1
    [-2, 1], [-2, -1], # Down 2, left/right 1
    [1, 2], [-1, 2], # Right 2, up/down 1
    [1, -2], [-1, -2]  # Left 2, up/down 1
  ]

  def initialize(position)
    @position = position # A array of two integers (i.e. [2, 4])
  end

  def valid_moves(position=@position)
    x, y = position
    moves = @@KNIGHT_MOVES.map { |dx, dy| [dx += x, dy += y] }
    moves.select { |nx, ny| nx.between?(0, 7) && ny.between?(0, 7) }
  end
end

knight = Knight.new([3, 4])

p knight.valid_moves