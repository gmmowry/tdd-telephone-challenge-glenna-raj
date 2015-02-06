
class Pizza

  attr_reader :name
  attr_accessor :description, :time_baked, :toppings

  def initialize(name, description, time_baked, toppings)
    @name = name
    @description = description
    @time_baked = 0 || time_baked
    @toppings = []
  end

  def add_topping(topping)
    toppings << topping
  end

  def required_bake_time
    self.toppings.each do |blap|
      i += blap.time
    end
    self.baketime = 900 + i
    return self.baketime
  end

  def bake!(time)
    self.time_baked += time
  end

end
