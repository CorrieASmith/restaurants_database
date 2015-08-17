require('sinatra')
require('sinatra/reloader')
require('./lib/food')
require('./lib/restaurants')
also_reload('lib/**/*.rb')
require('pg')


DB = PG.connect({:dbname => "my_restaurants"})

get('/') do
  erb(:index)
end

get('/restaurants/form') do
  erb(:form)
end

get('/restaurants') do
  erb(:restaurants)
end

post('/restaurants') do
  name = params.fetch('name')
  location = params.fetch('location')
  phone = params.fetch('phone')
  id = params.fetch('id')
  @restaurant = Restaurant.new({:name => name, :location => location, :phone => phone, :id => id})
  @restaurant.save()
  erb(:restaurants)
end

get('/restaurants/:id') do
  @restaurant_id = params.fetch('id')
  erb(:foods)
end

post('/restaurants/:id') do
  type = params.fetch('type')
  cost = params.fetch('cost')
  rating = params.fetch('rating')
  @food = Food.new({:type => type, :cost => cost, :rating => rating})
  @food.save()
  erb(:foods)
end
