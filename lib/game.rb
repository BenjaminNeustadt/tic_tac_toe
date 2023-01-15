require_relative './board'
require_relative './player'

class Game

  MARKER = {player_1: 'X', player_2: 'O'}


  WINNING_MOVES = [
    'X','X','X',
    false,false,false,
    false,false,false],
    [
    false,false,false,
    'X','X','X',
    false,false,false]
    [
    false,false,false,
    false,false,false,
    'X','X','X']
    [
    'X',false,false,
    'X',false,false,
    'X',false,false]
    [
    false,'X',false,
    false,'X',false,
    false,'X',false]
    [
    false,false,'X',
    false,false,'X',
    false,false,'X']
    [
    'X',false,false,
    false,'X',false,
    false,false,'X']
    [
    false,false,'X',
    false,'X',false,
    'X',false,false]
    [
    'O','O','O',
    false,false,false,
    false,false,false]
    [
    false,false,false,
    'O','O','O',
    false,false,false]
    [
    false,false,false,
    false,false,false,
    'O','O','O']
    [
    false,false,false,
    false,false,false,
    false,false,false]
    [
    'O',false,false,
    'O',false,false,
    'O',false,false]
    [
    false,'O',false,
    false,'O',false,
    false,'O',false]
    [
    false,false,'O',
    false,false,'O',
    false,false,'O']
    [
    'O',false,false,
    false,'O',false,
    false,false,'O']
    [
    false,false,'O',
    false,'O',false,
    'O',false,false]

  private

  def initialize
    @board = Array.new(9, false)
    @player_1 = Player.new(MARKER[:player_1])
    @player_2 = Player.new(MARKER[:player_2])
    @current_player = current_player
  end

  attr_reader :board, :player_1, :player_2, :current_player
  attr_accessor :current_player

  public

  def place(position, marker)
    board.mark(position, marker) unless board[position]
  end

  def mark(position, token)
    @board[position] = token
  end

  def toggle_player
    @current_player = @current_player == player_2 ? player_1 : player_2
  end

  def over_winner(board)

    ## rows
    top_row = [0, 1, 2]
    middle_row = [3, 4, 5]
    last_row = [6, 7, 8]
    ## columns
    left_column = [0, 3, 6]
    middle_column = [1, 4, 7]
    right_column = [2, 5, 8]
    ## diagonals
    left_diagonal = [0, 4, 8]
    right_diagonal = [2, 4, 6]

    player_1_elements = ['X', 'X', 'X']
    player_2_elements = ['O', 'O', 'O']

    ## ROWS
    # check top row win
    win_top_row_player_1 = top_row.zip(player_1_elements).all? {|position, element| board[position] == element}
    win_top_row_player_2 = top_row.zip(player_2_elements).all? {|position, element| board[position] == element}

    # check middle row win
    win_mid_row_player_1 = middle_row.zip(player_1_elements).all? {|position, element| board[position] == element}
    win_mid_row_player_2 = middle_row.zip(player_2_elements).all? {|position, element| board[position] == element}

    # check last row win
    win_last_row_player_1 = last_row.zip(player_1_elements).all? {|position, element| board[position] == element}
    win_last_row_player_2 = last_row.zip(player_2_elements).all? {|position, element| board[position] == element}

    ## COLUMNS
    # check left column win
    win_left_column_p1 = left_column.zip(player_1_elements).all? {|position, element| board[position] == element}
    win_left_column_p2 = left_column.zip(player_2_elements).all? {|position, element| board[position] == element}

    # check middle column win
    win_middle_column_p1 = middle_column.zip(player_1_elements).all? {|position, element| board[position] == element}
    win_middle_column_p2 = middle_column.zip(player_2_elements).all? {|position, element| board[position] == element}

    # check right column win
    win_right_column_p1 = right_column.zip(player_1_elements).all? {|position, element| board[position] == element}
    win_right_column_p2 = right_column.zip(player_2_elements).all? {|position, element| board[position] == element}

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
