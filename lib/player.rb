require 'colorize'

class Player

  private

  attr_reader :marker

  def initialize(marker, colour: none)
    @marker = marker.send(colour)
  end

  public

  def to_s
    marker.to_s
  end

end
