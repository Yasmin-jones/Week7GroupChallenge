require 'pg'
require 'bcrypt'

class User 
  include BCrypt

  attr_reader :name, :email, :password


  def initialize(name:, email:, password:)
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
    encrypted_password = BCrypt::Password.create(password)

    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'user_database_test')
      else
      connection = PG.connect(dbname: 'user_database')
    end


  result = connection.exec(
    "INSERT INTO users_table (name, email, password)
    VALUES ('#{name}', '#{email}', '#{encrypted_password}')
    RETURNING name, email, password;"
  )
  
  User.new(
    name: result[0]['name'],
    email: result[0]['email'],
    password: result[0]['password']
  )
  
  end 
  
  

  



end


