feature 'user clicks login hyperlink' do 
    scenario 'user visits homepage' do 
            visit('/')
            click_on('login')
            fill_in 'email address', with: 'testing@hotmail.com'
            fill_in 'password', with: '12345'
            click_button 'Login'
    end 
    
end 