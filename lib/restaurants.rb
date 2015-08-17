class Restaurant
  attr_reader(:name, :location, :phone)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @location = attributes.fetch(:location)
    @phone = attributes.fetch(:phone)
  end

  define_method(:==) do |other|
    self.name() == other.name && self.location == other.location && self.phone == other.phone
  end

  define_singleton_method(:all) do
    results = DB.exec("SELECT * FROM restaurants;")
    restaurants = []
    results.each() do |result|
      name = result.fetch("name")
      location = result.fetch("location")
      phone = result.fetch("phone")
      restaurants.push(Restaurant.new({:name => name, :location => location, :phone => phone}))
    end
    restaurants
  end
end
