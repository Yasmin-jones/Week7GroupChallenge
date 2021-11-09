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
    @email = params[:email_address] 
    @password = params[:password]
    erb :confirm
  end 

  run! if app_file == $0
end
