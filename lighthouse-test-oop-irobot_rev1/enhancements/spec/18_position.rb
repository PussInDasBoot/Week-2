require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
  end

  describe '.in_position(x,y)' do
    it 'should display an array of all robots in position (x,y)' do
      expect(Robot.in_position(0,0)).to include(@robot, @robot2, @robot3)
    end
  end

end