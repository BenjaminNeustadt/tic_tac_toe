require 'colorize'
require_relative '../lib/game'

RSpec.describe Report do

  before(:each) do
    @game = Game.new
  end

  context "#report_winner" do

    it "prints a message announcing player 1 as the winner" do
      result = "The game is won by player #{@game.player_1.to_s}!"
      expect(@game.report_winner(true,false)).to include(result)
    end

    it "prints a message announcing player 2 as the winner" do
      result = "The game is won by player #{@game.player_2.to_s}!"
      expect(@game.report_winner(false,true)).to include(result)
    end

    it "prints a message announcing that no one wins" do
      expect(@game.report_winner(false,false)).to eq(false)
    end

  end


end

