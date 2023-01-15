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
