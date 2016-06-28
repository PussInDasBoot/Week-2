class Barracks
  attr_reader :gold, :food, :hp

  def initialize
    @gold = 1000
    @food = 80
    @hp = 500
  end

  def can_train_footman?
    food >= 2 && gold >= 135
    # if !(food < 2 || gold < 135)
    #   return false
    # end
    # true
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      footman = Footman.new
    end

    # if can_train_footman? == false
    #   return nil
    # end
  end
  def can_train_peasant?
    food >= 5 && gold >= 90
  end
  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      footman = Peasant.new
    # if can_train_peasant? == false
    #   return nil
    end
  end
  def damage(ap)
    @hp -= ap
  end
end
