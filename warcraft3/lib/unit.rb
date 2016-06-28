# unit.rb
class Unit

  attr_reader :health_points, :attack_power
# attr_accessor :damage_points

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
    # @damage_points = 0
  end

  def damage(ap)
    # self.damage_points += ap
    @health_points -= ap
  end

  def attack!(enemy)
    enemy.damage(attack_power)
  end

end
