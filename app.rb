require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end


  get '/' do
    
    erb :homepage
  end

  get '/login' do 
    erb :login
  end 

  # post '/name' do 
  #   $user_name = User.new(params[:name])
  #   redirect '/confirm'
  # end 

  # get '/confirm' do 
  #   #new 
  #   @user_name = $user_name.name 
  #   @user_name.save!

  #   erb :confirm
  # end 

  post '/confirm' do 
    #new 
    # $user_name = User.new(params[:name])
    # @user_name = $user_name.name 
    # @user_name.save!

    #old
    @name = params[:name] 
    #does this need to be posted here?
    @email = params[:email_address] 
    @password = params[:password]
    erb :confirm
  end 


  get '/confirm' do 
    @user = User.new
    @user.password = params[:password]
    @user.email = params[:email]
    @user.name = params[:name]
    @user.save!
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
