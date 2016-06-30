require 'pry'

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
    # Can only carry up to maximum weight of item
    return false unless items_weight + item.weight <= MAXIMUM_WEIGHT_OF_ITEM
    # Automatically equips weapon if item is a weapon
    if item.is_a?(Weapon)
      self.equipped_weapon = item
    end
    # If needs health and item is box of bolts, feeeeeeeed
    if item.is_a?(BoxOfBolts) && health <= 80
      item.feed(self)
    end
    # add the item to the items inventory and add its accumulated weight
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
    if can_attack?(enemy)
      if equipped_weapon
        equipped_weapon.hit(enemy)
        if equipped_weapon.is_a?(Grenade)
          self.equipped_weapon = nil
        end
      else
      enemy.wound(5)
      end
    end
  end

  def can_attack?(enemy)
    # If an weapon is a Grenade, can attack if are two spaces away above or below
    if equipped_weapon.is_a?(Grenade)
      two_next_to = (position[0] + enemy.position[0]).abs == 2
      two_above_or_below = (position[1] + enemy.position[1]).abs == 2
      two_next_to || two_above_or_below
    else
    # If not a grenade, the left-right or up-down positions of you relative to your enemy are 1, then you can attack
      next_to = (position[0] + enemy.position[0]).abs == 1
      above_or_below = (position[1] + enemy.position[1]).abs == 1
      next_to || above_or_below
    end
  end

end

class DeadRobotError < StandardError
  'Cannot heal a robot with 0 health'
end

class NotARobotError < StandardError
  'Can only attack a robot'
end
