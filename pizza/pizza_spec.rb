require 'rspec'
require_relative 'pizza'
require_relative 'topping'

describe "Pizza" do

  let(:spinach) { Topping.new(name: "Spinach",
    required_bake_time: 50)}
  let(:pizza) { Pizza.new(name: "Florentine",
   description: "Spinach",
   toppings: [spinach]) }

  describe "#initialize" do
    it "should have the name 'Florentine'" do
      expect(pizza.name).to_eq "Florentine"
    end

    it "should have the description 'Spinach'" do
      expect(pizza.description).to_eq "Spinach"
    end

    it "must have a name" do
      expect { Pizza.new }.to raise_error
    end

    it "should have a time_baked attribute which defaults to zero" do
      expect(pizza.time_baked).to_eq 0
    end

    it "should have toppings" do
      expect(pizza.toppings).to be_an Array
    end

    it "should return a topping from the array" do
      pizza.toppings[0].to be_a Topping
    end
  end

  describe "#bake!" do
    it "should increment the time_baked" do
      pizza.bake!(4)
      expect (pizza.time_baked).to_eq 4
    end

    it "should increment the time_baked for each topping" do
      pizza.bake!(4)
      pizza.toppings.all? {|topping| topping.time_baked == 4}.to be_true
    end
  end

  describe "#baked?" do
    it "should return false if pizza is unbaked" do
      expect(pizza.baked?).to be_false
    end

    it "should return true if pizza is baked" do
      pizza.bake!(pizza.required_bake_time)
      expect(pizza.baked?).to be_true
    end
  end

  describe "#finished_toppings" do
    it "returns an array" do
      expect(pizza.finished_toppings).to be_a Array
    end

    it "returns finished toppings" do
      pizza.bake!(50)
      expect(pizza.finished_toppings.length).to_eq 1
    end
  end


  describe "#unfinished_toppings" do
    it "returns an array" do
      expect(pizza.unfinished_toppings).to be_a Array
    end

    it "returns unfinished toppings" do
      expect(pizza.unfinished_toppings.length).to_eq 1
    end
  end
end

describe "Topping" do
  let(:topping) { Topping.new(name: "Chicken",
    required_bake_time: 600)}

  describe "#initialize" do
    it "should have the name 'Chicken'" do
      expect(topping.name).to_eq "Chicken"
    end

    it "should have the required_bake_time 10" do
      expect(topping.required_bake_time).to_eq 600
    end

    it "must have a name" do
      expect { Topping.new(required_bake_time: 100) }.to raise_error
    end

    it "must have a required bake time" do
      expect { Topping.new(name: "Mussels") }.to raise_error
    end

    it "should have a time_baked attribute which defaults to zero" do
      expect(topping.time_baked).to_eq 0
    end
  end

  describe "#bake!" do
    it "should increment the time_baked" do
      topping.bake!(300)
      expect(topping.time_baked).to_eq 300
    end
  end

  describe "#baked?" do
    it "should return false if unbaked" do
      expect(topping.baked?).to be_false
    end

    it "should return true if baked" do
      topping.bake!(topping.required_bake_time)
      expect(topping.baked?).to be_true
    end
  end
end

# ~> LoadError
# ~> cannot load such file -- /Users/apprentice/Desktop/raj-glenna/tdd-telephone-challenge-glenna-raj/pizza/pizza
# ~>
# ~> /Users/apprentice/Desktop/raj-glenna/tdd-telephone-challenge-glenna-raj/pizza/pizza_spec.rb:2:in `require_relative'
# ~> /Users/apprentice/Desktop/raj-glenna/tdd-telephone-challenge-glenna-raj/pizza/pizza_spec.rb:2:in `<main>'
