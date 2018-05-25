require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/adoption.rb' )

get '/adoptions' do
  @adoptions = Adoption.all
  @customers = Customer.all
  @available_animals = Animal.availableToAdopt
  erb ( :"adoptions/index" )
end

post '/adoptions' do
  adoption = Adoption.new(params)
  adoption.save
  @animal = Animal.find(params[:animal_id])
  @animal.change_status
  @animal.update
  redirect to("/adoptions")
end

get '/adoptions/animals' do
  @adoptions = Adoption.all
  erb ( :"adoptions/show" )
end




# post "/adoptions/:id/delete" do
#   Adoption.delete(params[:id])
#   redirect to "/adoptions"
# end
