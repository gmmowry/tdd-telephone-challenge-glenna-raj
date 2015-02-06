class Topping

  attr_reader :name
  attr_accessor :required_bake_time, :time_baked

  def initialize(name, required_bake_time)
    @name = name
    @required_bake_time = 10 || required_bake_time
    @time_baked = 0
  end

  def bake!(time)
    @time_baked += time.to_i
  end

  def baked?
    if time_baked < required_bake_time
      return false
    else
      return true
    end
  end

end

