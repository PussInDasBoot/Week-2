class Barracks
  attr_reader :gold, :food, :hp, :lumber

  def initialize
    @gold = 1000
    @food = 80
    @hp = 500
    @lumber = 500
  end

  GOLD_COST_FOOTMAN = 135
  FOOD_COST_FOOTMAN = 2
  GOLD_COST_PEASANT = 90
  FOOD_COST_PEASANT = 5


  def can_train_footman?
    food >= FOOD_COST_FOOTMAN && gold >= GOLD_COST_FOOTMAN
  end

  def train_footman
    if can_train_footman?
      @gold -= GOLD_COST_FOOTMAN
      @food -= FOOD_COST_FOOTMAN
      footman = Footman.new
    end
  end

  def can_train_peasant?
    food >= FOOD_COST_PEASANT && gold >= GOLD_COST_PEASANT
  end

  def train_peasant
    if can_train_peasant?
      @gold -= GOLD_COST_PEASANT
      @food -= FOOD_COST_PEASANT
      footman = Peasant.new
    end
  end

  def train_siege_engine
    @lumber -= 60
    @gold -=200
    @food -= 3
    seige_engine = SiegeEngine.new
  end

  def damage(ap)
    @hp -= ap
  end
end
