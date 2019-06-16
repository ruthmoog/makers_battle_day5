class Player
  attr_reader :name, :hp

  DEFAULT_HIT_POINTS = 60

  def initialize(name)
    @name = name
    @hp = DEFAULT_HIT_POINTS
  end

  def attack(player)
    player.damage
  end

  def damage
    @hp -= 10
  end
end