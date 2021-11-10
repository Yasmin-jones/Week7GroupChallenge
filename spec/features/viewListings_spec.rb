feature 'user clicks view listings hyperlink' do 
  scenario 'user visits property listings' do 
          visit('/')
          click_on('login')
          fill_in 'email address', with: 'testing@hotmail.com'
          fill_in 'password', with: '12345'
          click_button 'Login'
          click_on('View listings')
          expect(page).to have_content 'Available Properties'
  end
end

  feature 'User can book a property' do
    scenario 'user selects book a property' do
      visit('/')
          click_on('login')
          fill_in 'email address', with: 'testing@hotmail.com'
          fill_in 'password', with: '12345'
          click_button 'Login'
          click_on('View listings')
          click_on('Request a Booking')
          expect(page).to have_content 'Please confirm booking'
    end
  end