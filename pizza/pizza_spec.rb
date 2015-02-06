require 'rspec'
require_relative 'pizza'
require_relative 'topping'


describe "Topping" do
  let(:name) { "Chicken" }
  let(:required_bake_time) { 600 }
  let(:topping) { Topping.new(name, required_bake_time)}

  describe "#initialize" do
    it "should have the name 'Chicken'" do
      expect(topping.name).to eq("Chicken")
    end

    it "should have the required_bake_time 10" do
      expect(topping.required_bake_time).to eq(10)
    end

    it "must have a name" do
      expect { Topping.new(required_bake_time: 100) }.to raise_error(ArgumentError)
    end

    it "must have a required bake time" do
      expect { Topping.new(name: "Mussels") }.to raise_error(ArgumentError)
    end

    it "should have a time_baked attribute which defaults to zero" do
      expect(topping.time_baked).to eq(0)
    end
  end

  describe "#bake!" do
    it "should increment the time_baked" do
      topping.bake!(300)
      expect(topping.time_baked).to eq(300)
    end
  end

  describe "#baked?" do
    it "should return false if unbaked" do
      expect(topping.baked?).to be_falsey
    end

    it "should return true if baked" do
      topping.bake!(topping.required_bake_time)
      expect(topping.baked?).to be_truthy
    end
  end
end


describe "Pizza" do

  let(:spinach) { Topping.new(name: "Spinach",
    required_bake_time: 50)}
  let(:pizza) { Pizza.new(name: "Florentine",
   description: "Spinach",
   toppings: [spinach]) }

  describe "#initialize" do
    it "should have the name 'Florentine'" do
      expect(pizza.name).to eq("Florentine")
    end

    it "should have the description 'Spinach'" do
      expect(pizza.description).to eq("Spinach")
    end

    it "must have a name" do
      expect { Pizza.new }.to raise_error(ArgumentError)
    end

    it "should have a time_baked attribute which defaults to zero" do
      expect(pizza.time_baked).to eq(0)
    end

    it "should have toppings" do
      expect(pizza.toppings).to be_a Array
    end

    it "should return a topping from the array" do
      pizza.toppings[0].to be_an_instance of Topping
    end
  end

  describe "#bake!" do
    it "should increment the time_baked" do
      pizza.bake!(4)
      expect (pizza.time_baked).to eq(4)
    end

    it "should increment the time_baked for each topping" do
      pizza.bake!(4)
      pizza.toppings.all? {|topping| topping.time_baked == 4}.to be_truthy
    end
  end

  describe "#baked?" do
    it "should return false if pizza is unbaked" do
      expect(pizza.baked?).to be_falsey
    end

    it "should return true if pizza is baked" do
      pizza.bake!(pizza.required_bake_time)
      expect(pizza.baked?).to be_truthy
    end
  end

  describe "#finished_toppings" do
    it "returns an array" do
      expect(pizza.finished_toppings).to be_a Array
    end

    it "returns finished toppings" do
      pizza.bake!(50)
      expect(pizza.finished_toppings.length).to eq(1)
    end
  end


  describe "#unfinished_toppings" do
    it "returns an array" do
      expect(pizza.unfinished_toppings).to be_a Array
    end

    it "returns unfinished toppings" do
      expect(pizza.unfinished_toppings.length).to eq(1)
    end
  end
end


# ~> LoadError
# ~> cannot load such file -- /Users/apprentice/Desktop/raj-glenna/tdd-telephone-challenge-glenna-raj/pizza/pizza
# ~>
# ~> /Users/apprentice/Desktop/raj-glenna/tdd-telephone-challenge-glenna-raj/pizza/pizza_spec.rb:2:in `require_relative'
# ~> /Users/apprentice/Desktop/raj-glenna/tdd-telephone-challenge-glenna-raj/pizza/pizza_spec.rb:2:in `<main>'
