require_relative '../lib/board.rb'

RSpec.describe Board do

  # we check that the boards setup  is correct
  it 'is a collection of 9 false elements initially' do
    board = Board.new
    expect(board.set_up).to be_an Array
    expect(board.set_up.all?(false)).to be true
    expect(board.set_up.length).to eq 9
  end

end
