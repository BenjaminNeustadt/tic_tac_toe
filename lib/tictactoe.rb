require 'colorize'
require_relative './game.rb'

module TicTacToe

  def self.start
    game = Game.new

    puts game.rules

    puts game.report_board

    until status = game.game_over? do

      move = gets.to_i
      if (0...game.board.size).include?(move)
        game.place(move)
        puts game.report_board
      else
        puts "Please play within the range, try again."
      end
    end

    puts status

  end

end
