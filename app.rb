require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/animal_controller')
require_relative('controllers/customer_controller')
require_relative('controllers/adoption_controller')


get '/' do
  erb( :index )
end
