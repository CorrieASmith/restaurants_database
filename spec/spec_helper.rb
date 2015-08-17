require('rspec')
require('pg')
require('food')
require('restaurants')

DB = PG.connect({:dbname => 'my_restaurants_test'})

  RSpec.configure do |config|
      config.after(:each) do
        DB.exec("DELETE FROM restaurants * ;")
  end
end


  RSpec.configure do |config|
    config.after(:each) do
      DB.exec("DELETE FROM food * ;")
  end
end
