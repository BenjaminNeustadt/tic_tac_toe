require_relative '../lib/game'

RSpec.describe Game do

  context '#place' do

    it 'changes state of the board' do
      game = Game.new
      expect(game.board.mark(2)).to eq false
      game.place(2, marker = 'X')
      expect(game.board.mark(2)).to eq 'X'
    end

    it 'returns the marker if the spot is played' do
      game = Game.new
      game.place(0, marker = 'O')
      expect(game.board.mark(0)).to eq 'O'
    end

    it 'returns nil if the spot is not playable' do
      game = Game.new
      game.place(5, marker = 'X')
      expect(game.place(5, marker = 'O')).to eq nil
    end

  end


end

