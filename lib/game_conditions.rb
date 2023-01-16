require_relative './prompt'

module Game_Conditions

  include Prompt

  WIN_COMBINATIONS= {
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

  def game_over?
    check_winner || check_draw
  end

  def check_winner

    winning_sequences = WIN_COMBINATIONS.values.flat_map { |combination| combination.values }

    player_1_elements = Array.new(3, player_1.to_s)
    player_2_elements = Array.new(3, player_2.to_s)

    report_winner(
      winning_sequences.any? { |win_combination| win_combination.zip(player_1_elements).all? {|position, element| board[position] == element} },
      winning_sequences.any? { |win_combination| win_combination.zip(player_2_elements).all? {|position, element| board[position] == element} }
    )
  end

  def check_draw
    board.all? && PROMPT[:draw] unless check_winner
  end

end
