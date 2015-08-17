class Food
  attr_reader(:type, :cost, :rating, :restaurant_id)

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
      type = result.fetch("type")
      cost = result.fetch("cost").to_i()
      rating = result.fetch("rating").to_i()
      restaurant_id = result.fetch("restaurant_id").to_i()
      foods.push(Food.new({:type => type, :cost => cost, :rating => rating, :restaurant_id => restaurant_id}))
    end
    foods
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO food (type, cost, rating, restaurant_id) VALUES ('#{@type}', #{@cost}, #{@rating}, #{@restaurant_id});")
  end

  define_method(:==) do |other|
    self.type == other.type && self.cost == other.cost && self.rating == other.rating && self.restaurant_id == other.restaurant_id
  end
end
