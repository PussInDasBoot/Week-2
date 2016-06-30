class Robot

  attr_reader :position, :items
  attr_accessor :items_weight, :health, :equipped_weapon

  MAXIMUM_WEIGHT_OF_ITEM = 250

  def initialize
    @position = [0,0]
    @items = []
    @items_weight = 0
    @health = 100
    @equipped_weapon
  end

  def move_left
    self.position[0] -= 1
  end

  def move_right
    self.position[0] += 1
  end

  def move_up
    self.position[1] += 1
  end

  def move_down
    self.position[1] -= 1
  end

  def pick_up(item)
    return false unless items_weight + item.weight <= MAXIMUM_WEIGHT_OF_ITEM
    if item.is_a?(Weapon)
      self.equipped_weapon = item
    end
    items << item
    self.items_weight += (item.weight)
  end

  def wound(wound_amount)
    # return self.health = 0 unless health - wound_amount > 0
    # self.health -= wound_amount

    if health - wound_amount < 0
      self.health = 0
    else
      self.health -= wound_amount
    end
  end

  def heal(heal_amount)
    # return self.health = 100 unless health + heal_amount < 100
    # self.health += heal_amount
    
    if health + heal_amount > 100
      self.health = 100
    else
      self.health += heal_amount
    end
  end

  def heal!(heal_amount)
    unless health > 0
      raise DeadRobotError
    end
    if health + heal_amount > 100
      self.health = 100
    else
      self.health += heal_amount
    end
  end

  def attack(enemy)
    unless enemy.is_a?(Robot)
      raise NotARobotError
    end
    if equipped_weapon
      equipped_weapon.hit(enemy)
    end
    enemy.wound(5)
  end

end

class DeadRobotError < StandardError
  'Cannot heal a robot with 0 health'
end

class NotARobotError < StandardError
  'Can only attack a robot'
end
