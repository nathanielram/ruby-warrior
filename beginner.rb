# LEVEL 1
class Player
  def play_turn(warrior)
    warrior.walk!
  end
end
  

# LEVEL 2
class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      warrior.walk!
    else
      warrior.attack!
    end
  end
end
  

# LEVEL 3
class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      if warrior.health < 20
        warrior.rest!
      else
        warrior.walk!
    else
      warrior.attack!
    end
  end
end
  

# LEVEL 4
class Player
  def initialize
    @max_health = 20
    @health = @max_health
  end
  
  def play_turn(warrior)
    if warrior.feel.empty?
      if warrior.health < @health || warrior.health == @max_health
        warrior.walk!
      else
        warrior.rest!
      end
    else
      warrior.attack!
    end
    @health = warrior.health
  end
end
  

# LEVEL 5
class Player
  def initialize
    @max_health = 20
    @health = @max_health
  end
  
  def play_turn(warrior)
    if warrior.feel.empty?
      if warrior.health < @health || warrior.health == @max_health
        warrior.walk!
      else
        warrior.rest!
      end
    else
      if warrior.feel.enemy?
        warrior.attack!
      else
        warrior.rescue!
      end
    end
    @health = warrior.health
  end
end


# LEVEL 6
class Player
  def initialize
    @max_health = 20
    @health = @max_health
    @touched_wall = false
  end
  
  def play_turn(warrior)
    if warrior.feel(:backward).wall? || @touched_wall
      if warrior.feel.empty?
        if warrior.health < @health || warrior.health == @max_health
          if warrior.health < 6
            warrior.walk! :backward
          else
            warrior.walk!
          end
        else
            warrior.rest!
        end
      else
        if warrior.feel.enemy?
          warrior.attack!
        else
          warrior.rescue!
        end
      end
    else
      if warrior.feel(:backward).empty?
        warrior.walk! :backward
      else warrior.feel(:backward).captive?
        warrior.rescue! :backward
        @touched_wall = true
      end
    end
    @health = warrior.health
  end
end
  

# LEVEL 7
class Player
  def initialize
    @max_health = 20
    @health = @max_health
    @touched_wall = false
  end
  
  def play_turn(warrior)
    if warrior.feel(:backward).wall? || @touched_wall
      if warrior.feel.empty?
        if warrior.health < @health || warrior.health == @max_health
          if warrior.health < 6
            warrior.walk! :backward
          else
            warrior.walk!
          end
        else
            warrior.rest!
        end
      else
        if warrior.feel.enemy?
          warrior.attack!
        else
          warrior.rescue!
        end
      end
    elsif warrior.feel.wall?
      warrior.pivot!
      @touched_wall = true
    end
    @health = warrior.health
  end
end
  

# LEVEL 8
class Player
  def initialize
    @max_health = 20
    @health = @max_health
    @touched_wall = false
  end
  
  def play_turn(warrior)
    if warrior.feel(:backward).wall? || @touched_wall
      @touched_wall = true
      if warrior.feel.empty? && !warrior.look[1].enemy? && !warrior.look[2].enemy?
        if warrior.health < @health || warrior.health == @max_health
          if warrior.health < 6
            warrior.walk! :backward
          else
            warrior.walk!
          end
        else
            warrior.rest!
        end
      else
        if warrior.look[0].captive? || warrior.look[1].captive? || warrior.look[2].captive?
          if warrior.feel.captive?
            warrior.rescue!
          else
            warrior.walk!
          end
        else
          warrior.shoot!
        end
      end
    elsif warrior.feel.wall?
      warrior.pivot!
      @touched_wall = true
    end
    @health = warrior.health
  end
end
  