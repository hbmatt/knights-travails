class Board
  def initialize(root)
    @grid = build_board
    @root = root
  end

  def build_board
    row = []
    finished_board = []
    x = 0
    y = 0

    until y > 7
      until x > 7
        row << [x, y]
        x += 1
      end
      finished_board << row
      row = []
      y += 1
    end

    finished_board
  end

  def build_path(initial, final, queue = [@root], path = [])
    current = queue.shift

    if current.position == final
      trace_path(initial, current)
    else
      path << current.position
      current.possible_moves.each do |cell|
        queue << Knight.new(cell, current)
      end

      build_path(initial, final, queue, path)
    end
  end

  def trace_path(initial, final)
    path = [final.position]
    current = final

    until current.parent.nil?
      path << current.parent.position
      current = current.parent
    end

    path.reverse
  end
end
