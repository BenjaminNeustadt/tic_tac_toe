require_relative '../lib/game'

RSpec.describe Game do


  before(:each) do
    @game = Game.new
  end

  context '#initialize' do
    it "creates a new board with 9 spaces" do
      expect(@game.board).to eq Array.new(9, false)
    end

    it "creates two new players" do
      expect(@game.player_1).to be_an_instance_of Player
      expect(@game.player_2).to be_an_instance_of Player
    end

    it "sets the current player to player 1" do
      expect(@game.current_player).to eq @game.player_1
    end

  end

  context '#place' do

    it "marks selected position on the board with current player's marker" do
      @game.place(1)
      expect(@game.board[0]).to eq @game.player_1.to_s
    end

    it "toggles the current player after a successful move" do
      @game.place(1)
      expect(@game.current_player).to eq @game.player_2
    end

    it 'returns nil if the spot is not playable' do
      @game.board[5] = true
      expect(@game.place(6)).to be_nil
    end

  end

end

