class Board
  def initialize(root)
    @root = root
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
