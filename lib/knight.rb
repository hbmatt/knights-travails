class Knight
  attr_accessor :position, :possible_moves, :parent

  def initialize(position = nil, parent = nil)
    @position = position
    @moves = [
      [1, 2], [-1, 2], [-1, -2], [1, -2],
      [2, 1], [-2, 1], [-2, -1], [2, -1]
    ]
    @possible_moves = find_possible_moves()
    @parent = parent
  end

  def find_possible_moves
    possible_moves = []

    @moves.each do |move|
      x = @position[0] + move[0]
      y = @position[1] + move[1]
      if x >=0 && y >= 0 && x <= 7 && y <= 7
        possible_moves << [x,y]
      end
    end

    possible_moves
  end
end
