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
end
