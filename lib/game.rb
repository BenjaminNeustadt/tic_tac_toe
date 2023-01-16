require 'colorize'
require_relative './board'
require_relative './player'

class Game

  PROMPT = {
    rules:  'Get three tokens in a row to win the game:'.yellow,
    player: 'Next player is: %<player>s'.cyan,
    draw:   'Game is a draw!'.yellow,
    win:    'The game is won by player %<player>s!'.yellow
  }

  BOARD = <<~BOARD
   %s || %s || %s
  -------------
   %s || %s || %s
  -------------
   %s || %s || %s
  BOARD

  MARKER = {
    player_1: 'X',
    player_2: 'O'
  }

  LINE = {
         row: {
           top:  [0, 1, 2],
        middle:  [3, 4, 5],
        bottom:  [6, 7, 8]
    },
      column: {
           left: [0, 3, 6],
         middle: [1, 4, 7],
          right: [2, 5, 8]
    },
    diagonal: {
          left:  [0, 4, 8],
         right:  [2, 4, 6]
    }
  }

  private

  def initialize
    @board = Array.new(9, false)
    @player_1 = Player.new(MARKER[:player_1], colour: :red)
    @player_2 = Player.new(MARKER[:player_2], colour: :green)
    toggle_player
  end

  attr_writer :current_player

  public

  attr_reader :board, :player_1, :player_2, :current_player

  def place(position)
    (mark(position) && toggle_player) unless board[position]
  end

  def mark(position)
    board[position] = current_player.to_s
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
    player_1_wins && PROMPT[:win] % {player: player_1} ||
    player_2_wins && PROMPT[:win] % {player: player_2}
  end

  def rules
    PROMPT[:rules]
  end

  def check_draw
    board.all? && PROMPT[:draw] unless check_winner
  end

  def report_board
    BOARD % board.map { |mark| mark || ' '} << PROMPT[:player] % {player: current_player}
  end

end

