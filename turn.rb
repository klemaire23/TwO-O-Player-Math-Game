require './question'
require './player'

class Turn
  def initialize(players)
    @players = players
    @current_player = @players.first
  end

  def current_player
    @current_player
  end

  def display_scores
    @players.each do |player|
      player.display_lives
    end
  end

  def switch_player
    @players.rotate!
    @current_player = @players.first
  end

  def process_turn
    puts "---- NEW TURN ----"
    question = Question.new
    puts "#{current_player.name}: #{question.instance_variable_get(:@question_text)}"
    answer = $stdin.gets.chomp.to_i

    if question.correct_answer?(answer)
      puts "#{current_player.name}: Correct!"
    else
      current_player.lose_life
      puts "#{current_player.name}: Seriously? No!"
    end

    display_scores
    switch_player
  end
end

player1 = Player.new
player2 = Player.new

players = [player1, player2]
turn = Turn.new(players)

turn.process_turn