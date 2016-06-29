require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(60,10)
  end

  describe "dead?" do
    it "returns true if unit has 0 hp" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be true
    end
  end

  describe "attack!" do
    it "will not attack other unit (return nil) if it is dead" do
      other_unit = Unit.new(60,10)
      expect(@unit). to receive(:dead?).and_return(true)
      expect(@unit.attack!(other_unit)).to be nil
    end
  
    it "will not attack (return nil) a dead unit" do
      other_unit = Unit.new(60,10)
      expect(other_unit). to receive(:dead?).and_return(true)
      expect(@unit.attack!(other_unit)).to be nil
    end
  end

end

