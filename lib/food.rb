class Food
  attr_reader(:type, :cost, :rating)

  define_method(:initialize) do |attributes|
    @type = attributes.fetch(:type)
    @cost = attributes.fetch(:cost)
    @rating = attributes.fetch(:rating)
    @restaurant_id = attributes.fetch(:restaurant_id)
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM food;")
    foods = []
    results.each() do |result|
      type = result.fetch(:type)
      cost = result.fetch(:cost)
      rating = result.fetch(:rating)
      foods.push(Food.new({:type => type, :cost => cost, :rating => rating}))
    end
    foods
  end
end
