feature 'user passes information add a new listing' do 
    scenario 'user adds listing' do 
      visit('/addListings')
      fill_in 'user_id', with: 'Yas'
      fill_in 'description', with: 'looks good'
      fill_in 'location', with: 'location'
      fill_in 'start_date', with: '07/09/2021'
      fill_in 'end_date', with: '09/09/2021'
      fill_in 'price', with: '1000'
      click_button 'Upload'
      expect(page).to have_content 'looks good'
    end 
  end