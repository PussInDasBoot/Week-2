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
    if can_attack?(enemy)
      enemy.damage(attack_power)
    end
  end

  def dead?
    health_points == 0
  end

  # You can only attack if you are alive and your enemy is alive
  def can_attack?(enemy)
    # !(dead? && enemy.is_a?(Unit)) || (enemy.is_a?(Unit) && enemy.dead?) 
    !dead? && !enemy.dead?
  end

end
