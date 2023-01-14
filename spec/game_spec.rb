require_relative '../lib/game'

RSpec.describe Game do

  context 'upon instantiate' do
    it 'creates an instance of board class' do
      game = Game.new
      expect(game.board).to be_an Array
    end
  end

  context '#place' do

    it 'changes state of the board' do
      game = Game.new
      expect(game.place(2, marker = 'X')).to eq "X"
      expect(game.place(2, marker = 'X')).to eq nil
    end

    it 'returns the marker if the spot is played' do
      game = Game.new
      expect(game.place(0, marker = 'O')).to eq 'O'
    end

    it 'returns nil if the spot is not playable' do
      game = Game.new
      game.place(5, marker = 'X')
      expect(game.place(5, marker = 'O')).to eq nil
    end

  end


end

