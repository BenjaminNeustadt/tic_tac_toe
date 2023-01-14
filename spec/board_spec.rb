require_relative '../lib/board.rb'

RSpec.describe Board do

  # we check that the boards setup  is correct
  it 'is a collection of 9 false elements initially' do
    board = Board.new
    expect(board.layout).to be_an Array
    expect(board.layout.all?(false)).to be true
    expect(board.layout.length).to eq 9
  end

end
