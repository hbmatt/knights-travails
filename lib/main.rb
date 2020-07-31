require_relative 'board.rb'
require_relative 'knight.rb'

class KnightsTravails
  def initialize
    @knight = ''
    @board = ''
  end

  def knight_moves(initial, final)
    @knight = Knight.new(initial)
    @board = Board.new(@knight)

    knight_path = @board.build_path(initial, final)

    puts "You made it in #{knight_path.length - 1} moves! Here's your path:"
    knight_path.each { |move| p move }
  end
end

KnightsTravails.new.knight_moves([3,3], [4,3])
puts ''
KnightsTravails.new.knight_moves([0,0], [7,7])