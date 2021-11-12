feature 'new user signs up' do 
  scenario 'user visits homepage' do 
          visit('/new')
          fill_in 'name', with: 'Scott Donovan'
          fill_in 'email', with: 'scott@hotmail.com'
          fill_in 'password', with: '5678'
          click_button 'sign up'
          #expect(page).to have_content 'Welcome Scott Donovan'
  end 
  
end 