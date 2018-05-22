require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/animal.rb' )

#index
get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

# create
post '/animals' do
  @animal = Animal.new(params)
  @animal.save
  redirect to "/animals"
end

get "/animals/new" do
  erb(:"animals/new")
end

get "/animals/:id" do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

# delete
get "/animals/:id/delete" do
  @animal = Animal.find(params[:id])
  erb(:"animals/delete")
end

post "/animals/:id/delete" do
  Animal.find(params[:id]).delete()
  redirect to "/animals"
end

get "/animals/:id/edit" do
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end


post "/animals/:id" do
  @animal = Animal.new(params)
  @animal.update()
  redirect to "/animals"
end
