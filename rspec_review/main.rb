class Customer
  attr_reader :name

  def initialize(name, budget)
    @name = name
    @budget = budget
  end

  def within_budget?(price)
    price <= budget
  end

end