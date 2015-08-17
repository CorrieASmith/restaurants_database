require('spec_helper')

describe(Restaurant) do

  describe('#==') do
    it("is the same restaurant if it has the same name") do
      restaurant1 = Restaurant.new({:name => 'Chipotle', :location => 'Portland', :phone => '555-555-5555'})
      restaurant2 = Restaurant.new({:name => 'Chipotle', :location => 'Portland', :phone => '555-555-5555'})
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
      restaurant = Restaurant.new({:name => 'Blue C Sushi', :location => 'Seattle', :phone => '666-666-6666'})
      restaurant.save()
      expect(Restaurant.all).to(eq([restaurant]))
    end
  end
end
