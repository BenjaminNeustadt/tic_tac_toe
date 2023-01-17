require 'colorize'
require_relative './board'
require_relative './player'
require_relative './report'
require_relative './game_conditions'
require_relative './player_tokens'
require_relative './prompt'

class Game

  include Game_Conditions
  include Player_Tokens
  include Prompt
  include Report

  private

  def initialize
    @board = Array.new(9, false)
    @player_1 = Player.new(MARKER[:player_1], colour: :red)
    @player_2 = Player.new(MARKER[:player_2], colour: :green)
    toggle_player
  end

  attr_writer :current_player

  public

  attr_reader :board, :player_1, :player_2, :current_player

  def place(position)
    (mark(position - 1) && toggle_player) unless board[position -1]
  end

  def mark(position)
    board[position] = current_player.to_s
  end

  def toggle_player
    self.current_player = current_player == player_1 ? player_2 : player_1
  end

end

