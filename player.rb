require './question'

class Player
  attr_reader :name, :lives

  def initialize(lives = 3)
    set_name
    @lives = lives
  end

  def set_name
    puts "Enter player name"
    @name = $stdin.gets.chomp
  end

  def answer_question
    question = Question.new
    puts "#{@name}: #{question.instance_variable_get(:@question_text)}"
    answer = $stdin.gets.chomp.to_i

    if question.correct_answer?(answer)
      puts "#{@name}: Correct!"
    else
      lose_life
      puts "#{@name}: Seriously? No!"
    end
  end

  def lose_life
    @lives -= 1
  end

  def display_lives
    puts "#{@name}: #{@lives}/3"
  end
end

player1 = Player.new
player2 = Player.new

player1.display_lives
player2.display_lives

player1.answer_question
player2.answer_question

player1.display_lives
player2.display_lives
