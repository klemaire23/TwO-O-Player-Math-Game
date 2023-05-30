require_relative 'player'
require_relative 'question'

class Game
  attr_accessor :game_running

  def initialize(player1, player2)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @current_player = ""
    @game_running = true
    @turn = 0
  end

  def start_game

    while @game_running
      puts "---- NEW TURN ----"
      # switch_turn
      answer_question
    end  
  end

  private

  def switch_turn
    @turn += 1
    if @turn % 2 == 0
    @current_player = @player2 
    else
    @current_player = @player1
    end
  end

  def answer_question
    switch_turn
    question = Question.new
    puts "#{@current_player.name}: #{question.instance_variable_get(:@question_text)}"
    answer = $stdin.gets.chomp.to_i

    if question.correct_answer?(answer)
      puts "#{@current_player.name}:YES! You are correct!"
    else
      lose_life
      puts "#{@current_player.name}: Seriously? No!"
    end
      display_lives
      end_game
  end

  def lose_life
    @current_player.lives -= 1
  end

  def display_lives
    puts "Player1: #{@player1.lives}/3 vs Player2: #{@player2.lives}/3"
  end

  def end_game
    if (@player1.lives == 0)
    puts "------ GAME OVER ------"
    winner = @player2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "Goodbye!"
    @game_running = false
  
    elsif (@player2.lives == 0)
      winner = @player1
      puts "#{winner.name} wins with a score of #{winner.lives}/3"
      puts "Goodbye!"
      @game_running = false

    end
  end
end
