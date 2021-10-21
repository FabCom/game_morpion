require 'bundler'
Bundler.require



$:.unshift File.expand_path('./../lib', __FILE__)

require 'app/Board'
require 'app/BoardCase'
require 'app/Game'
require 'app/Display'
require 'app/Player'
require 'app/colorizeString'

class Application
  attr_accessor :players, :play_again

  def initialize
    @screen = Display.new
    @screen.init()
    @screen.rules()
    @players = Array.new(2)
    init_players()
    play_game()
  end

  def init_players
    @players.each_index do |index|
      @screen.ask_name(index)
      @players[index] = Player.new
    end
  end

  def play_game
    @play_again = true
    while @play_again == true
      Game.new(@players)
    end
    if @play_again == false
      puts "Fin de la partie"
    end
  end
end

Application.new
