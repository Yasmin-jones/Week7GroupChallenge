require 'pg'
class Listing
  attr_reader :location, :description, :start_date, :end_date, :price

  def initialize(location:, description:, start_date:, end_date:, price:)
    @location = location
    @description = description 
    @start_date = start_date
    @end_date = end_date
    @price = price
  end

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'app_database_test')
      else
      connection = PG.connect(dbname: 'app_database')
      end

    result = connection.exec("SELECT * FROM app_table;")
    result.map do |listing|
    Listing.new(description: listing['description'], location: listing['location'], 
              start_date: listing['start_date'], end_date: listing['end_date'], price: listing['price'])
      
      end
  end

  def self.create(description:, location:, start_date:, end_date:, price:)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'app_database_test')
      else
      connection = PG.connect(dbname: 'app_database')
    end

      connection.exec("INSERT INTO app_table (description, location, start_date, end_date, price) 
                      VALUES('#{description}', '#{location}', '#{start_date}', '#{end_date}', '#{price}')
                      RETURNING description, location, start_date, end_date, price")

                      # p Listing.new(
                      # description: result[0]['description'],
                      # location: result[0]['location'],
                      # start_date: result[0]['start_date'],
                      # end_date: result[0]['end_date'])
                    

  end


    

end