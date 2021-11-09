feature 'user logs in homepage' do 
    scenario 'user visits homepage' do 
            visit('/')
            expect(page).to have_content 'Hello World'
    
    end 
    
end 