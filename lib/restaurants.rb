class Restaurant
  attr_reader(:name, :location, :phone, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @location = attributes.fetch(:location)
    @phone = attributes.fetch(:phone)
    @id = attributes.fetch(:id)
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
      id = result.fetch("id").to_i()
      restaurants.push(Restaurant.new({:name => name, :location => location, :phone => phone, :id => id}))
    end
    restaurants
  end

  define_method(:save) do
    results = DB.exec("INSERT INTO restaurants (name, location, phone) VALUES ('#{@name}', '#{@location}', '#{@phone}') RETURNING id;")
    @id = results.first().fetch('id').to_i()
  end
end
