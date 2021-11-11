require 'pg'
class Listing
  attr_reader :location, :description, :start_date, :end_date

  def initialize(location:, description:, start_date:, end_date:)
    @location = location
    @description = description 
    @start_date = start_date
    @end_date = end_date
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
              start_date: listing['start_date'], end_date: listing['end_date'])
      
      end
  end

  def self.create(description:, location:, start_date:, end_date:)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'app_database_test')
      else
      connection = PG.connect(dbname: 'app_database')
    end

      connection.exec("INSERT INTO app_table (description, location, start_date, end_date) 
                      VALUES('#{description}', '#{location}', '#{start_date}', '#{end_date}')
                      RETURNING description, location, start_date, end_date")

                      # p Listing.new(
                      # description: result[0]['description'],
                      # location: result[0]['location'],
                      # start_date: result[0]['start_date'],
                      # end_date: result[0]['end_date'])
                    

  end


    

end