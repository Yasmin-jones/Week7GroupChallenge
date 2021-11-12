require 'sinatra/base'
require 'sinatra/reloader'
require './lib/listings'
require './lib/user'

class MakersBnB < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end


  get '/' do
    erb :homepage
  end

  get '/new' do
    @new_user = User.all
    erb :new
  end

  post '/new' do
    User.create(name: params[:name], email: params[:email], password: params[:password])
    redirect '/new'
  end


  get '/login' do 
    erb :login
  end 

  get '/confirm' do 
    @user = User.new
    @user.password = params[:password]
    @user.email = params[:email]
    @user.name = params[:name]
    @user.save!
    erb :confirm 
  end 

  post '/confirm' do
    @name = params[:name] 
    #does this need to be posted here?
    @email = params[:email_address] 
    @password = params[:password]
    erb :confirm
  end 


  

  get "/viewListings" do
    @listings = Listing.all
    erb :viewListings

  end

  post "/viewListings" do
    Listing.create(description: params[:description],location: params[:location],start_date: params[:start_date],end_date: params[:end_date],price: params[:price])
    redirect "/viewListings"
  end

get "/addListings" do
  erb :addListings
end



  get '/request_booking' do
    "Please confirm booking"
  end


  run! if app_file == $0
end
