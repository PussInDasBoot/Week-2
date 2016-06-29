require('rspec')
require_relative('./main')

describe Customer do
  describe 'should start with a name and a budget' do
    before :each do
      @customer = Customer.new('John', 1000)
    end

    it "should have a name" do
      expect(@customer.name).to eq('John')
    end

    it "should have a budget" do
      expect(@customer.budget).to eq(1000)
    end
  end

  describe '#within_budget?' do
    before :each do
      @customer = Customer.new('Sara', 2000)
    end

    it "should return true if a price is within the budget" do
      allow(@customer).to receive(:budget) { 1999 }
      expect(@customer.budget).to eq(1999)
      expect(@customer.within_budget?(1500)).to eq(true)
    end

    it "should return false if a price is out of budget" do
      allow(@customer).to receive(:budget) { 100 }
      expect(@customer.budget).to eq(100)
      expect(@customer.within_budget?(1000)).to eq(false)
    end
  end
end