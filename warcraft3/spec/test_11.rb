require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barrack = Barracks.new
  end

  it "has and knows its HP (health points)" do
    expect(@barrack.hp).to eq(500)
  end

  describe "#damage" do
    it "should reduce the buildings's hp by the attack_power specified" do
      # TEST = Barracks::GOLD_COST_FOOTMAN
      @barrack.damage(10)
      expect(@barrack.hp).to eq(490)
    end

    it "should reduce the building's hp by half of the attack power specified if attacked by a footman" do
      footman = Footman.new
      footman.attack!(@barrack)
      expect(@barrack.hp).to eq(495)
    end
  end

end