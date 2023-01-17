module Prompt

  PROMPT = {
    rules:  'Get three tokens in a row to win the game:'.yellow,
    player: 'Next player is: %<player>s'.cyan,
    draw:   'Game is a draw!'.yellow,
    win:    'The game is won by player %<player>s!'.yellow,
    range:  'Please play within the range, try again.'.yellow
  }

  def range_error
    PROMPT[:range]
  end
end
