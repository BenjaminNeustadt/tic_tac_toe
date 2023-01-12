require_relative '../lib/board.rb'

RSpec.describe Board do

  it 'is an array' do
    board = Board.new
    expect(board.display).to be_an Array
  end

  it ' is an array of arrays' do
    board = Board.new
		expected = [nil, nil, nil, nil, nil, nil, nil, nil, nil]

		actual = board.display
    expect(actual).to eq expected
  end

end
