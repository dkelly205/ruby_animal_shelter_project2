require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )

#index
get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

# create
