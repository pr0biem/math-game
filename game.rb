require 'colorize'
@player1_lives = 3
@player2_lives = 3
@turn = 1

def play_again
  if @player1_lives && @player2_lives > 0
    player_turn
  else
    case 
    when @player1_lives == 0
      slowput("#{@player2_name} has defeated #{@player1_name} in a battle of brains")
    when @player2_lives == 0
      slowput("#{@player1_name} has defeated #{player2_name} in a battle of brains")
    end
    slowput("Would you like to play again?")
    play_again = gets.chop.downcase
    if play_again == "yes"
      @player2_lives = 3
      @player1_lives = 3
      player_turn
    else
      slowput("Welcome to die.")
      exit
    end
  end
end


def player_turn
  case 
  when @turn % 2 == 0
    @turn -= 1
    slowput("#{@player2_name}'s turn")
  else
    @turn += 1
    slowput("#{@player1_name}'s turn")
  end
  questions
end



def questions
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
  if @turn % 2 == 0
    @player1_lives -= 1
    slowput("#{@player1_name} has lost a life and has #{@player1_lives} left")
  else
    @player2_lives -= 1
    slowput("#{@player2_name} has lost a life and has #{@player2_lives} left")
  end
  play_again
end


def correct
  slowput("You are correct, and live to do more math.")
  play_again
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



def input
  slowput("Wanna play a game?")
  sleep(0.5)
  slowput("Player 1, put in your name now!")
  @player1_name = gets.chomp.capitalize!
  slowput("Now Player 2, what is your name?")
  @player2_name = gets.chomp.capitalize!
  slowput("Let's begin.")
  sleep(0.5)
  slowput("All of your lives you have hidden behind your walls")
  slowput("acting as though math was nothing to you.")
  slowput("Perhaps today will be the day where math could save one of your lives")
  slowput("I hope you are ready")
  play_again
end

input