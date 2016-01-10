class Player
  attr_accessor :lives, :name
  
  def initialize
    @name = name
    @lives = 3
    @points = 0
  end


  def lose_life
    @lives -= 1
  end


  def gain_point
    @points += 1
  end
end
