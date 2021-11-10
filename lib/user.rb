require 'pg'
require 'bcrypt'

class User 
  include BCrypt

  attr_reader :name, :email, :password


  def initialize 
    @name = name
    @email = email 
    @password = password 

  end 
   
  def self.all
    if ENV['ENVIROMENT'] == 'test'
    connection = PG.connect(dbname: 'user_database_test')
    else
    connection = PG.connect(dbname: 'user_database')
    end

    result = connection.exec("SELECT * FROM users_table;")
    result.map { |users| users['email'] }
  end

  def self.create(email:, password:, name:)

    # @user = User.new()
    # @user.password = params[password]
    # @user.email = params[email]
    # @user.name = params[password]
    # @user.save!
    
  end 
  
  def printAccount 

      # user = User.new('hi', 'test', '123')
      # p user.save!

      # hash a user's password
      @password = Password.create("my grand secret")
      p ("-------------")
      p "hello"
      print @password #=> "$2a$12$C5.FIvVDS9W4AYZ/Ib37YuWd/7ozp1UaMhU28UKrfSxp2oDchbi3K"

      # store it safely
      @user.update_attribute(:password, @password)

      # read it back
      @user.reload!
      @db_password = Password.new(@user.password)

      # compare it after retrieval
      @db_password == "my grand secret" #=> true
      @db_password == "a paltry guess"  #=> false
      
  end 

  



end


