feature 'user clicks view listings hyperlink' do 
  scenario 'user visits property listings' do 
         user_login
          click_on('View listings')
          expect(page).to have_content 'Available Properties'
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