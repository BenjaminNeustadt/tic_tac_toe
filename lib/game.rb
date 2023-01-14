require_relative './board'

class Game

  def initialize
    @board = Board.new.set_up
  end

attr_reader :board

  def place(position, marker)
    board[position] = marker unless board[position]
  end

end


