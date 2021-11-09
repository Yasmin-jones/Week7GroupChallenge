require 'pg'

p "Setting up test database....."

connection = PG.connect(dbname: 'user_database_test')

connection.exec("TRUNCATE users_table_test;")

def enter_database
  connection = PG.connect(dbname: 'user_database_test')
  # Add the test data
  connection.exec("INSERT INTO 
    users_table_test (email, password, name) 
    VALUES ('fred@makersacademy.com',
    '12345',
    'Fred Smith');")
end