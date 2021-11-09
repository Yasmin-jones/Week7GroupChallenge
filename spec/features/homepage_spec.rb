feature 'user clicks login hyperlink' do 
    scenario 'user visits homepage' do 
            visit('/')
            click_on('login')
    end 
    
end 

feature 'user signs up' do 
    scenario 'user fills in email address, password and password confirmation' do 
            visit('/')
            fill_in 'name', with: 'Ben Jones'
            fill_in 'email address', with: 'test@gmail.com'
            fill_in 'password', with: '123'
            click_button 'sign up'
    end 
    
end 



