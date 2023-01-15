require_relative './board'
require_relative './player'

class Game

  MARKER = {player_1: 'X', player_2: 'O'}

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

  def check_winner(board)

    LINE = {row: {top: [0, 1, 2] , middle: [3, 4, 5], bottom: [6, 7, 8]}, column: {left: [0, 3, 6], middle: [1, 4, 7], right: [2, 5, 8]}, diagonal: {left: [0, 4, 8], right: [2, 4, 6]}}

    winning_sequences = [LINE[:row][:top], LINE[:row][:middle], LINE[:row][:bottom], LINE[:column][:left], LINE[:column][:middle], LINE[:column][:right], LINE[:diagonal][:left], LINE[:diagonal][:right] ]

    player_1_elements = ['X', 'X', 'X']
    player_2_elements = ['O', 'O', 'O']

    # check player 1 win

    player_1_wins =
    winning_sequences.each do |winning_combination|
      winning_combination.zip(player_1_elements).all? {|position, element| board[position] == element}
    end

    # if any are true then it should puts
    # "player 1 wins!"

    # check player 2 win

    player_2_wins =
    winning_sequences.each do |combination|
      combination.zip(player_2_elements).all? {|position, element| board[position] == element}
    end

    player_2_wins = winning_sequences.each { |win_combo| win_combo.zip(player_2_elements).all? {|position, element| board[position] == element} }

    # if any are true then it should puts
    # "player 2 wins!"

    ## ROWS
    # check top row win
    win_top_row_player_1  = LINE[:row][:top].zip(player_1_elements).all? {|position, element| board[position] == element}
    win_top_row_player_2  = LINE[:row][:top].zip(player_2_elements).all? {|position, element| board[position] == element}

    # check middle row win
    win_mid_row_player_1  = LINE[:row][:middle].zip(player_1_elements).all? {|position, element| board[position] == element}
    win_mid_row_player_2  = LINE[:row][:middle].zip(player_2_elements).all? {|position, element| board[position] == element}

    # check last row win
    win_last_row_player_1 = LINE[:row][:bottom].zip(player_1_elements).all? {|position, element| board[position] == element}
    win_last_row_player_2 = LINE[:row][:bottom].zip(player_2_elements).all? {|position, element| board[position] == element}

    ## COLUMNS
    # check left column win
    win_left_column_p1    = LINE[:column][:left].zip(player_1_elements).all? {|position, element| board[position] == element}
    win_left_column_p2    = LINE[:column][:left].zip(player_2_elements).all? {|position, element| board[position] == element}

    # check middle column win
    win_middle_column_p1  = LINE[:column][:middle].zip(player_1_elements).all? {|position, element| board[position] == element}
    win_middle_column_p2  = LINE[:column][:middle].zip(player_2_elements).all? {|position, element| board[position] == element}

    # check right column win
    win_right_column_p1   = LINE[:column][:right].zip(player_1_elements).all? {|position, element| board[position] == element}
    win_right_column_p2   = LINE[:column][:right].zip(player_2_elements).all? {|position, element| board[position] == element}

    ## DIAGONALS
    # check left diagonal
    win_left_diagnoal_p1 = LINE[:diagonal][:left].zip(player_1_elements).all? {|position, element| board[position] == element}
    win_left_diagonal_p2 = LINE[:diagonal][:left].zip(player_2_elements).all? {|position, element| board[position] == element}

    # check right diagonal
    win_right_diagnoal_p1 = LINE[:diagonal][:right].zip(player_1_elements).all? {|position, element| board[position] == element}
    win_right_diagonal_p2 = LINE[:diagonal][:right].zip(player_2_elements).all? {|position, element| board[position] == element}

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


=end
