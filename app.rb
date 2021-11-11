require 'sinatra/base'
require 'sinatra/reloader'
require './lib/listings'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end


  get '/' do
    
    erb :homepage
  end

  get '/login' do 
    erb :login
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
    p @listings
    erb :viewListings

  end

get "/addListings" do
  erb :addListings
end

  post "/viewListings" do
    Listing.create(params[:description], params[:location], params[:start_date], params[:end_date], params[:price])
    redirect "/viewListings"
  end

  get '/request_booking' do
    "Please confirm booking"
  end

  run! if app_file == $0
end
