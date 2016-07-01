require 'pry'

class Robot

  attr_reader :position, :items
  attr_accessor :items_weight, :health, :equipped_weapon, :shield

  MAXIMUM_WEIGHT_OF_ITEM = 250

  @@list = []

  def initialize
    @position = [0,0]
    @items = []
    @items_weight = 0
    @health = 100
    @equipped_weapon
    @shield = 50
    @@list << self
  end

  def self.list
    @@list
  end

  def self.in_position(x, y)
    @@list.select { |robot| robot.position == [x, y]}
  end

  def scan
    nearby_robots = []
    (-1..1).each do |x_offset|
      (-1..1).each do |y_offset|
        nearby_robots += Robot.in_position(position[0] + x_offset, position[1] + y_offset)
      end
    end
    nearby_robots
    # Robot.in_position(position[0]-1, position[1]+1)
    # Robot.in_position(position[0], position[1]+1)
    # Robot.in_position(position[0]+1, position[1]+1)
    # Robot.in_position(position[0]-1, position[1])
    # Robot.in_position(position[0]+1, position[1])
    # Robot.in_position(position[0]-1, position[1]-1)
    # Robot.in_position(position[0], position[1]-1)
    # Robot.in_position(position[0]+1, position[1]+1)
  end

  def move_left
    position[0] -= 1
  end

  def move_right
    position[0] += 1
  end

  def move_up
    position[1] += 1
  end

  def move_down
    position[1] -= 1
  end

  def pick_up(item)
    # Can only carry up to maximum weight of item
    if items_weight + item.weight <= MAXIMUM_WEIGHT_OF_ITEM
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
  end

  def wound(wound_amount)
    # return self.health = 0 unless health - wound_amount > 0
    # self.health -= wound_amount
    if shield - wound_amount < 0
      health_damage = (shield - wound_amount).abs
      @shield = 0
      if health - health_damage < 0
        self.health = 0
      else
        self.health -= health_damage
      end
    else
      @shield -= wound_amount
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
      if equipped_weapon.is_a?(Grenade) && in_range?(enemy, 2)
        equipped_weapon.hit(enemy)
        @equipped_weapon = nil
      elsif in_range?(enemy, 1)
        equipped_weapon.hit(enemy)
      end
    else
      enemy.wound(5) if in_range?(enemy, 1)
    end
  end

  def in_range?(enemy, range)
    # If an weapon is a Grenade, can attack if are two spaces away above or below
    next_to = (position[0] + enemy.position[0]).abs
    above_or_below = (position[1] + enemy.position[1]).abs
    next_to == range || above_or_below == range
  end

end

class DeadRobotError < StandardError
  'Cannot heal a robot with 0 health'
end

class NotARobotError < StandardError
  'Can only attack a robot'
end
