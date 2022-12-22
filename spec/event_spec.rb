require './lib/item'
require './lib/food_truck'
 require './lib/event'
require 'pry'

RSpec.describe Event do
  before :each do
   @event = Event.new("South Pearl Street Farmers Market")
   @food_truck = FoodTruck.new("Rocky Mountain Pies")
   @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
   @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @item1 = Item.new({ name: 'Peach Pie (slice)', price: '$3.75' })
    @item2 = Item.new({ name: 'Apple Pie (slice)', price: '$2.50' })
    @item3 = Item.new({ name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({ name: 'Banana Nice Cream', price: '$4.25' })
  end
  describe '#initialize' do 
    it 'is an Event' do 
        expect(@event).to be_a(Event)
    end

    it 'has a name' do 
        expect(@event.name).to eq("South Pearl Street Farmers Market")
    end

    it 'has an array of FoodTrucks' do 
        expect(@event.food_trucks).to eq([])
    end
  end

  describe '#add_food_truck' do 
    it 'can add food-trucks to event' do 
        @event.add_food_truck(@food_truck)
        expect(@event.food_trucks).to eq([@food_truck])
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)
        expect(@event.food_trucks).to eq([@food_truck, @food_truck2, @food_truck3])
    end
  end
  
  describe '#food_truck_names' do 
    it 'can list all the food trucks names' do 
        @event.add_food_truck(@food_truck)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)
        expected_output = [@food_truck.name, @food_truck2.name, @food_truck3.name]
        expect(@event.food_truck_names).to eq(expected_output)
    end
  end

  describe '#food_trucks_that_sell' do 
    it 'has a method to show food trucks that sell as an array' do 
      @food_truck.stock(@item1, 35)
      @food_truck.stock(@item2, 7)
      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65)
      @event.add_food_truck(@food_truck)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_trucks).to eq([@food_truck, @food_truck2, @food_truck3])
      expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck, @food_truck3])
      expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
    end
  end
end