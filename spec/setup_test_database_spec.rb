require 'pg'

p "Setting up test database....."

connection = PG.connect(dbname: 'user_database_test')
connection.exec("TRUNCATE users_table_test;")
connection = PG.connect(dbname: 'app_database_test')
connection.exec("TRUNCATE app_table;")

def enter_database
  connection = PG.connect(dbname: 'user_database_test')
  # Add the test data
  connection.exec("INSERT INTO 
    users_table_test (email, password, name) 
    VALUES ('fred@makersacademy.com',
    '12345',
    'Fred Smith');")
end

def add_row_to_app_database_test
  # connection = PG.connect(dbname: 'app_database_test')
  # connection.exec("INSERT INTO app_table_test (description, location, start_date, end_date)
  # VALUES ('Beach House', 'Miami', '25-07-2022', '30-07-2022');")
end