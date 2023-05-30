require_relative 'player'
require_relative 'question'
require_relative 'game'

puts "Player 1, please enter your name:"
@player1 = $stdin.gets.chomp

puts "Player 2, please enter your name:"
@player2 = $stdin.gets.chomp

game = Game.new(@player1, @player2)
game.start_game