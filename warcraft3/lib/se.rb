class SiegeEngine < Unit

  def initialize
    super(400, 50)
  end

  def attack!(enemy)
    if enemy.is_a?(Barracks)
      enemy.damage(attack_power * 2)
    elsif enemy.is_a?(SiegeEngine)
      enemy.damage(attack_power)
    end
  end
end