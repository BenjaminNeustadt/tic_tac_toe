require_relative './board'

class Game

  def initialize
    @board = Board.new
    # @player_1 = Player.new(MARKER[:player_1])
    # @player_2 = Player.new(MARKER[:player_2])
  end

  attr_reader :board

  def place(position, marker)
    board.mark = [position, marker] unless board.mark(position)
  end

end

=begin

class Player

  private

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  public

  def to_s
    marker.to_s
  end

end

# The Script
#
game = Game.new
puts game.instructions

unless game.over?

loop

move = gets.to_i
game.place(move, game.current_player)
game.toggle_player

=end
