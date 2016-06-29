require_relative 'spec_helper'

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  it "has and knows its HP (health points)" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "has and knows its AP (attack power)" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  describe "#attack!" do
      it "returns nil when trying to attack other unit that is not a siege engine" do
        other_unit = Unit.new(60,60)
        expect(@siege_engine.attack!(other_unit)).to eq nil
      end

      it "will reduce other siege engine hp by ap when attacking a siege engine" do
        other_siege_engine = SiegeEngine.new
        @siege_engine.attack!(other_siege_engine)
        expect(other_siege_engine.health_points).to eq(350)
      end
    end


end

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "has lumber and knows its lumber amount" do
    expect(@barracks.lumber).to eq(500)
  end

  describe "#train_siege_engine" do
    it "should take 60 lumber, 200 gold and 3 food to train a siege engine" do
      @barracks.train_siege_engine
      expect(@barracks.lumber).to eq(440)
      expect(@barracks.gold).to eq(800)
      expect(@barracks.food).to eq(77)
    end
  end

  describe "#damage" do
    it "Deducts hp by 100 (2 x AP) when attaked by siege engine" do
      siege_engine = SiegeEngine.new
      siege_engine.attack!(@barracks)
      expect(@barracks.hp).to eq(400)
    end
  end

end

