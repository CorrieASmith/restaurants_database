require('spec_helper')

describe(Restaurant) do

  describe('#==') do
    it("is the same restaurant if it has the same name") do
      restaurant1 = Restaurant.new({:name => 'Chipotle', :location => 'Portland', :phone => '555-555-5555', :id => 1})
      restaurant2 = Restaurant.new({:name => 'Chipotle', :location => 'Portland', :phone => '555-555-5555', :id => 2})
      expect(restaurant1).to(eq(restaurant2))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Restaurant.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a new restaurant") do
      restaurant = Restaurant.new({:name => 'Blue C Sushi', :location => 'Seattle', :phone => '666-666-6666', :id => 3})
      restaurant.save()
      expect(Restaurant.all).to(eq([restaurant]))
    end
  end

  describe('#food') do
    it("displays the food in a restaurant") do
      restaurant = Restaurant.new({:name => 'Sinju Sushi', :location => 'Clackamas', :phone => '777-777-7777', :id => 4})
      restaurant.save()
      food = Food.new({:type => "Sushi", :cost => 16, :rating => 5, :restaurant_id => restaurant.id()})
      food.save()
      expect(restaurant.food()).to(eq([food]))
    end
  end
end
