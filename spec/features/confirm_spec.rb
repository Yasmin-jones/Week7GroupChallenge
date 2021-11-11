feature 'account user can upload a listing' do 
    scenario 'user clicks on the add listings button' do 
        user_login 
        visit('/confirm')
        click_on('Add listings')
    end 

end 

feature 'account user can view the listings' do 
    scenario 'user clicks on the view listings button' do 
        user_login
        visit('/confirm')
        click_on('View listings')
    end 

end 

feature 'account user sign out and return to homepage' do 
    scenario 'user clicks on the sign out button' do 
        user_login
        visit('/confirm')
        click_on('Sign Out')
    end 

end 