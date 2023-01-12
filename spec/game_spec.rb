require_relative '../lib/game'

RSpec.describe Game do

  context 'upon instantiate' do
    it 'creates an instance of board class' do
      game = Game.new
      expect(game.board).to be_an Array
    end
  end

end
