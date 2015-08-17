require('spec_helper')

describe(Restaurant) do

  describe('#==') do
    it("is the same restaurant if it has the same name") do
      restaurant1 = Restaurant.new({:name => 'Chipotle', :location => 'Portland', :phone => '555-555-5555'})
      restaurant2 = Restaurant.new({:name => 'Chipotle', :location => 'Portland', :phone => '555-555-5555'})
      expect(restaurant1).to(eq(restaurant2))
    end
  end
end
