require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb' )
require_relative( '../models/animal.rb' )

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

get "/customers/name" do
  @customers = Customer.search(params['name'])
  erb(:"customers/index")
end

get "/customers/:id" do
  @customer = Customer.find(params[:id])
  @animals = @customer.animals
  erb(:"customers/show")
end

get "/customers/:id/delete" do
  @customer = Customer.find(params[:id])
  @animals = @customer.animals
  erb(:"customers/delete")
end

post "/customers/:id/delete" do
  Customer.delete(params[:id])
  redirect to "/customers"
end

get "/customers/:id/edit" do
  @customer = Customer.find(params[:id])
  erb(:"customers/edit")
end

post "/customers/:id" do
  @customer = Customer.new(params)
  @customer.update()
  redirect to "/customers"
end
