class Board

  def initialize
    @layout = Array.new(9, false)
  end

  attr_reader :layout

  # writer
  def mark=(args)
    position, token = args
    @layout[position] = token
  end

  # reader
  def mark(position)
    layout[position]
  end

end
