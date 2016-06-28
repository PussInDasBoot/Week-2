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
      @barrack.damage(5)
      expect(@barrack.hp).to eq(495)
    end
  end
end

describe Footman do

  before :each do
    @footman = Footman.new
  end

  describe "#attack!" do
    it "should do deal 5 ((1/2 AP).ceil) damage to the building unit" do
      building = Barracks.new
      expect(building).to receive(:damage).with(5)
      @footman.attack!(building)
    end
  end

end

