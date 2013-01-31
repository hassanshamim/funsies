class Player

  def initialize
    @warrior = warrior
  end

  attr_reader :warrior

  def set_turn_state
    @health = warrior.health
  end

  def safe?
    warrior.health < @health ? false : true
  end

  def empty?
      warrior.feel.nil?
  end

  def retreat_and_heal
    if safe?
      empty? ? warrior.rest! : warrior.walk!(backward)
    end
  end

  def engage!
    empty? ? warrior.walk! : warrior.attack!
  end

  def play_turn(warrior)
    unless warrior.health == 20
      retreat_and_heal
      engage!
    else
      engage!
    end
    set_turn_state
  end
end
