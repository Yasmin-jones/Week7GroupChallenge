require 'pg'

class User
   
  def self.all
    if ENV['ENVIROMENT'] == 'test'
    connection = PG.connect(dbname: 'user_database_test')
    else
    connection = PG.connect(dbname: 'user_database')
    end

    result = connection.exec("SELECT * FROM users_table;")
    result.map { |users| users['email'] }
  end

end

