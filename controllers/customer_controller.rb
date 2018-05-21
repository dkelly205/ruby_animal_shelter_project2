require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )

#index
get '/customers' do
  @customers = Customer.all()
  erb(:"customers/index")
end

# create
post '/customers' do
  @customer = Customer.new(params)
  @customer.save
  redirect to "/customers"
end

get "/customers/new" do
  erb(:"customers/new")
end
