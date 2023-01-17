require_relative './prompt'

module Report

  include Prompt

  BOARD = <<~BOARD
   %s || %s || %s
  -------------
   %s || %s || %s
  -------------
   %s || %s || %s
  BOARD

  def rules
    PROMPT[:rules]
  end

  def report_board
    BOARD % board.each_with_index.map { |mark, index| mark || index } << PROMPT[:player] % {player: current_player}
  end

  def report_winner(*args)
    player_1_wins, player_2_wins = args
    player_1_wins && PROMPT[:win] % {player: player_1} ||
    player_2_wins && PROMPT[:win] % {player: player_2}
  end

end

