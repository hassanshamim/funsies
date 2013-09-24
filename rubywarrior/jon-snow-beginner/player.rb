class Player
  def initialize
    @health, @previous_health = 0, 0 # initialize these values
  end

  def warrior
    @warrior
  end

  def set_up_for_round(warrior)
    @action = :unused
    @warrior = warrior
    @health, @previous_health = warrior.health, @health
  end

  def taking_damage?
    @health < @previous_health
  end

  def safe_to_rest?
    warrior.feel.empty? && @health < 20 && !taking_damage?
  end

  def play_turn(warrior)
    set_up_for_round(warrior)
    space = warrior.feel
    if safe_to_rest?
      warrior.rest!
    elsif space.empty?
      warrior.walk!
    elsif space.captive?
      warrior.rescue!
    else
      warrior.attack!
    end
  end
end

