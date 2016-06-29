# unit.rb
class Unit

  attr_reader :health_points, :attack_power

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def damage(ap)
    @health_points -= ap
  end

  def attack!(enemy)
    if cannot_attack?
      nil
    else
    enemy.damage(attack_power)
    end
  end

  def dead?
    health_points == 0
  end

  def cannot_attack?
    (dead? && enemy.is_a?(Unit)) || (enemy.is_a?(Unit) && enemy.dead?) 
  end

end
