feature 'user clicks view listings hyperlink' do 
  scenario 'user visits property listings' do
    connection = PG.connect(dbname: 'app_database')
    connection.exec("INSERT INTO app_table (description, location, start_date, end_date, price)
    VALUES ('Log Cabin', 'Hampshire', '26-09-2022', '31-09-2022', '1000');")
         user_login
          click_on('View listings')
          expect(page).to have_content 'Log Cabin'
  end
end

  feature 'User can book a property' do
    scenario 'user selects book a property' do
          user_login
          click_on('View listings')
          click_on('Request a Booking')
          expect(page).to have_content 'Please confirm booking'
    end
  end