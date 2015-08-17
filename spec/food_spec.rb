require('spec_helper')

describe(Food) do
  describe('.all') do
    it("will be empty at first") do
      expect(Food.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a food to the database") do
      test_food = Food.new({:type => 'sushi', :cost => 10, :rating => 5, :restaurant_id => 1})
      test_food.save()
      expect(Food.all()).to(eq([test_food]))
    end
  end
end
