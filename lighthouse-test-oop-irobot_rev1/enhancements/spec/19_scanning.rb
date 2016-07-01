require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
    @robot4 = Robot.new
    @robot5 = Robot.new
  end

  describe '#scan' do
    it 'return array of robots that are in the 8 surrounding squares of current robot' do
      @robot2.move_up
      @robot3.move_down
      @robot4.move_left
      @robot5.move_right
      # expect(@robot.scan).to include(@robot2, @robot3)
      expect(@robot.scan).to include(@robot2, @robot3, @robot4, @robot5)
    end
  end

end