# LEVEL 1
class Player
  def play_turn(warrior)
    warrior.walk! warrior.direction_of_stairs
  end
end
  
  
# LEVEL 2
class Player
  def play_turn(warrior)
    if warrior.feel(warrior.direction_of_stairs).enemy?
      warrior.attack! warrior.direction_of_stairs
    else  
      if warrior.health == 20
        warrior.walk! warrior.direction_of_stairs
      else
        warrior.rest!
      end
    end
  end
end