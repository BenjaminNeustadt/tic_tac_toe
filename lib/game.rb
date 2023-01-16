require_relative './board'
require_relative './player'

class Game

  BOARD = <<~BOARD
   %s || %s || %s
  -------------
   %s || %s || %s
  -------------
   %s || %s || %s
  BOARD

  MARKER = {player_1: 'X', player_2: 'O'}

  LINE = {row: {top: [0, 1, 2] , middle: [3, 4, 5], bottom: [6, 7, 8]}, column: {left: [0, 3, 6], middle: [1, 4, 7], right: [2, 5, 8]}, diagonal: {left: [0, 4, 8], right: [2, 4, 6]}}

  private

  def initialize
    @board = Array.new(9, false)
    @player_1 = Player.new(MARKER[:player_1])
    @player_2 = Player.new(MARKER[:player_2])
    toggle_player
  end

  attr_writer :current_player

  public

  attr_reader :board, :player_1, :player_2, :current_player

  def place(position, marker)
    board.mark(position, marker) unless board[position]
  end

  def mark(position, token)
    board[position] = token
  end

  def toggle_player
    self.current_player = current_player == player_1 ? player_2 : player_1
  end

  def game_over?
    check_winner || check_draw
  end

  def check_winner

    winning_sequences = LINE.values.flat_map { |combination| combination.values }

    player_1_elements = Array.new(3, player_1.to_s)
    player_2_elements = Array.new(3, player_2.to_s)

    report_winner(
      winning_sequences.any? { |win_combination| win_combination.zip(player_1_elements).all? {|position, element| board[position] == element} },
      winning_sequences.any? { |win_combination| win_combination.zip(player_2_elements).all? {|position, element| board[position] == element} }
    )
  end

  def report_winner(*args)
    player_1_wins, player_2_wins = args
    player_1_wins && "#{player_1.to_s} Wins" || player_2_wins && "#{player_2.to_s} Wins"
  end

  def check_draw
    board.all? && "The Game is a Draw" unless check_winner
  end

  def report_board
    BOARD % board.map { |mark| mark || ' '} << "Next player is: #{current_player}"
  end

end

