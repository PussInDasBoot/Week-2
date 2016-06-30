require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#heal!" do
    it "should raise exception when trying to heal a dead robot (health = 0)" do
      allow(@robot).to receive(:health){0}
      expect{@robot.heal!(10)}.to raise_error
    end
  end

  describe "#attack" do
    it "should raise an exception when trying to attack a non robot" do
      @non_robot = Item.new('name', 10)
      expect{@robot.attack(@non_robot)}.to raise_error
    end
  end
end
