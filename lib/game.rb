require_relative './board'

class Game

  def initialize
    @board = Board.new.display
  end

attr_reader :board


  def place(position)

    if position == 1 
      @board = ["x", nil, nil, nil, nil, nil, nil, nil, nil]
    elsif position == 2
      @board = [nil, "x", nil, nil, nil, nil, nil, nil, nil]
    elsif position == 9
      @board = [nil, nil, nil, nil, nil, nil, nil, nil, "x"]
    end

  end

end