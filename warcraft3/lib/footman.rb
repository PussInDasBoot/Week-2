# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit
  def initialize
    super(60, 10)
    # @damage_points = 0
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
  end

  # def damage(ap)
  #   self.damage_points += ap
  #   self.health_points -= ap
  # end


  def attack!(enemy)
    if enemy.is_a?(Barracks)
      enemy.damage((attack_power / 2).ceil)
    else
      enemy.damage(attack_power)
    end
  end

end
