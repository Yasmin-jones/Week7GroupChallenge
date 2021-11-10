require 'sinatra/base'
require 'sinatra/reloader'

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
    erb :viewListings
  end

get "/addListings" do
  erb :addListings
end

  post "/viewLisings" do
    viewListings.create(params[:description], params[:location], params[:start_date], params[:end_date], params[:price])
    redirect "/viewListings"
  end

  get '/request_booking' do
    "Please confirm booking"
  end

  run! if app_file == $0
end
