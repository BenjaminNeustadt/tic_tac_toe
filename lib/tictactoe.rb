require 'colorize'
require_relative './game.rb'

module TicTacToe

  def self.start
    game = Game.new

    puts game.rules

    puts game.report_board

    until status = game.game_over? do

      move = gets.to_i
      game.place(move)
      puts game.report_board
    end

    puts status

  end

end
