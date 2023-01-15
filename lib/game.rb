require_relative './board'
require_relative './player'

class Game

  MARKER = {player_1: 'X', player_2: 'O'}

  LINE = {row: {top: [0, 1, 2] , middle: [3, 4, 5], bottom: [6, 7, 8]}, column: {left: [0, 3, 6], middle: [1, 4, 7], right: [2, 5, 8]}, diagonal: {left: [0, 4, 8], right: [2, 4, 6]}}

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

    winning_sequences = [LINE[:row][:top], LINE[:row][:middle], LINE[:row][:bottom], LINE[:column][:left], LINE[:column][:middle], LINE[:column][:right], LINE[:diagonal][:left], LINE[:diagonal][:right] ]

    player_1_elements = ['X', 'X', 'X']
    player_2_elements = ['O', 'O', 'O']

    player_2_wins = winning_sequences.each { |win_combo| win_combo.zip(player_2_elements).all? {|position, element| board[position] == element} }
    player_1_wins = winning_sequences.each { |win_combo| win_combo.zip(player_1_elements).all? {|position, element| board[position] == element} }

    if player_1_wins
      "Winner player 1"
    end

    if player_2_wins
      "Winner player 2"
    end

  end

end

