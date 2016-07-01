require_relative 'spec_helper'

describe Batteries do
  before :each do
    @battery = Batteries.new
  end

    it "has the name 'battery'" do
      expect(@battery.name).to eq("Battery")
    end

    it "should have weight of 25" do
      expect(@battery.weight).to eq(25)
    end

  describe "#recharge" do
    it "will set the shield of the robot back to 50" do
      robot = Robot.new

      robot.wound(40)
      @battery.recharge(robot)
      expect(robot.shield).to eq(50)
    end
  end

end
