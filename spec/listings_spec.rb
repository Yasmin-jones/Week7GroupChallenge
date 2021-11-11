require 'pg'
require 'listings'

describe '.all' do
  it 'returns listings data' do
    connection = PG.connect(dbname: 'app_database_test')
    connection.exec("INSERT INTO app_table_test (description, location, start_date, end_date)
    VALUES ('Beach House', 'Miami', '25-07-2022', '30-07-2022');")
    connection.exec("INSERT INTO app_table_test (description, location, start_date, end_date)
    VALUES ('River House', 'Wales', '27-07-2022', '31-07-2022');")
    connection.exec("INSERT INTO app_table_test (description, location, start_date, end_date)
    VALUES ('Lake House', 'Chesire', '01-07-2022', '06-07-2022');")
    # listing = Listing.create(description: 'Beach House', location: 'Miami', start_date: '25-07-2022', end_date: '30-07-2022')
    # Listing.create(description: 'River House', location: 'Wales', start_date: '29-07-2022', end_date: '30-08-2022')
    # Listing.create(description: 'Lake House', location: 'Chesire', start_date: '26-08-2022', end_date: '30-08-2022')

    listings = Listing.all
    expect(listings).to include{'Beach House'}
    expect(listings).to include{'River House'}
    expect(listings).to include{'Lake House'}
    #expect(listings).to include{'30-07-2022'}
  end

  # describe '.create' do
  #   it 'creates a new listing' do
  #     listing = Listing.create(description: 'Beach House', location: 'Miami', start_date: '25-07-2022', end_date: '30-07-2022').first
  #     p listing
  #     expect(listing['description']).to eq 'Beach House'
  #     expect(listing['location']).to eq 'Miami'
  #     expect(listing['start_date']).to eq '25-07-2022'
  #     expect(listing['end_date']).to eq '30-07-2022'

  #   end
  # end

  
end

