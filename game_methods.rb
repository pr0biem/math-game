class Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @turn = 1
    @started == 0
  end

  def slowput(text)
    case
    when text == "I hope you are ready"
      sleep(0.5)
      text.each_char {|char| print char.colorize(:red); sleep(0.15) }
      sleep(0.5)
      print ".".colorize(:red)
      sleep(1)
      print ".".colorize(:red)
      sleep(1)
      print ".".colorize(:red)
      sleep(1)
      print "\n"   
    when text == "Player 1, put in your name now!" || "Now Player 2, what is your name?"
      text.each_char {|char| print char.colorize(:red); sleep(0.05) }
      print "\n"
    else
      text.each_char {|char| print char.colorize(:red); sleep(0.05) }
      print "\n" 
      sleep(0.4)
    end
  end


  def play?
    (@player1.lives > 0) && (@player2.lives > 0) 
  end

  def continue
    case
    when @player1.lives == 0
      slowput("#{@player2.name} has defeated #{@player1.name} in a battle of brains")
    when @player2.lives == 0
      slowput("#{@player1.name} has defeated #{@player2.name} in a battle of brains")
    end
  end

  def defeated 
    slowput("Would you like to play again?")
    play_again = gets.chop.downcase
    if play_again == "yes"
      @player2.lives = 3
      @player1.lives = 3
    else
      slowput("Welcome to die.")
      exit
    end
  end


  def player_turn
    if @turn == 2
      @turn = 1
      @player = @player2
      slowput("#{@player2.name}, it's your turn")
    else
      @turn = 2
      @player = @player1
      slowput("#{@player1.name}, it's your turn")
    end
  end


  def ask_question
    num1 = rand(1...20)
    num2 = rand(1...20)
    addition = num1 + num2
    subtraction = num1 - num2
    multiply = (num1 * num2)
    operators = rand(1...3)
    case
    when @operators == 1
      addition
      slowput( "What is #{num1} plus #{num2}?" )
      answer = gets.chomp.to_i
      if answer == addition
        correct
      else
        wrong
      end
    when operators == 2
      subtraction
      slowput("What is #{num1} minus #{num2}?")
      answer = gets.chomp.to_i
      if answer == subtraction
        correct
      else
        wrong
      end
    else
      multiply
      slowput("What is #{num1} times #{num2}?")
      answer = gets.chomp.to_i
      if answer == multiply
        correct
      else
        wrong
      end
    end
  end


  def wrong
    slowput("INCORRECT!!!")
    @player.lose_life
    slowput("#{@player.name} has lost a life and has #{@player.lives} left")
  end


  def correct
    slowput("You are correct, and live to do more math.")
  end


  def start
    slowput("Wanna play a game?")
    sleep(0.5)
    slowput("Player 1, put in your name now!")
    @player1.name = gets.chomp.capitalize!
    slowput("Now Player 2, what is your name?")
    @player2.name = gets.chomp.capitalize!
    slowput("Let's begin.")
    sleep(0.5)
    slowput("All of your lives you have hidden behind your walls")
    slowput("acting as though math was nothing to you.")
    slowput("Perhaps today will be the day where math could save one of your lives")
    slowput("I hope you are ready")
  end
end