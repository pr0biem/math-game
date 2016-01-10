require 'colorize'
require_relative 'player.rb'
require_relative 'game_methods.rb'

def start
  game = Game.new
  @started = 0

  while game.play?
    if @started == 0
      game.start
      @started = 1
    else
      game.player_turn
      game.ask_question
      game.continue
    end
    if game.play? == false
      game.defeated
    end
  end
end

start