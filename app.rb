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
