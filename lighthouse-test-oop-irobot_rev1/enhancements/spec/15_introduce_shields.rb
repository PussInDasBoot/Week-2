# Since grenades have a range of 2, if the robot has one equipped,
# it can attack an enemy robot that is 2 tiles away instead of just 1 tile away
# That said, it will also discard/unequip the grenade

require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe '#shield' do
    it 'has a shield and it starts at 50' do
      expect(@robot.shield).to eq(50)
    end
  end

  describe '#wound' do
    it 'if robot has a shield, deduct wound damage from shield' do
      @robot2 = Robot.new
      @robot2.move_up

      # expect(@robot).to receive(:wound).with(5)
      
      @robot2.attack(@robot)
      expect(@robot.shield).to eq(45)
      # expect(@robot.health).to eq(100)
    end

    it 'if the wound damage is greater than the shield, shield then returns 0 and deduct remaining damage from health' do

      @robot.wound(53)

      expect(@robot.shield). to eq(0)
      expect(@robot.health). to eq(97)

    end
  end

end