require_relative '../lib/game'

RSpec.describe Game do

  context 'upon instantiate' do
    it 'creates an instance of board class' do
      game = Game.new
      expect(game.board).to be_an Array
    end
  end

  context 'place method' do
    it 'is able to add a piece to position 1' do
      game = Game.new
      game.place(1)
      expected = ["x", nil, nil, nil, nil, nil, nil, nil, nil]
      actual = game.board
      expect(actual).to eq expected
    end

    it 'is able to add a piece to position 2' do
      game = Game.new
      game.place(2)
      expected = [nil, "x", nil, nil, nil, nil, nil, nil, nil]
      actual = game.board
      expect(actual).to eq expected
    end

    it 'is able to add a piece to position 9' do
      game = Game.new
      game.place(9)
      expected = [nil, nil, nil, nil, nil, nil, nil, nil, "x"]
      actual = game.board
      expect(actual).to eq expected
    end
  end


end
