class Question

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @question_text = "What does #{@num1} plus #{@num2} equal?"
    @answer = @num1 + @num2
  end

  def correct_answer?(player_answer)
    player_answer == @answer
  end

end