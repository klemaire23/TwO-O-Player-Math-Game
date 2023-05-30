require './question'

class Player
  attr_accessor :name, :lives

  def initialize(lives = 3, name)
    @lives = lives
    @name = name
  end

  def set_name
    puts "Enter player name"
    @name = $stdin.gets.chomp
  end


end

# player1 = Player.new("Kamila")
# player2 = Player.new("Jasper")

# player1.display_lives
# player2.display_lives

# player1.answer_question
# player2.answer_question

# player1.display_lives
# player2.display_lives
