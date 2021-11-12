



def user_login
  visit('/')
  click_on('login')
  fill_in 'email address', with: 'testing@hotmail.com'
  fill_in 'password', with: '12345'
  click_button 'Login'
end

def user_sign_up
  visit('/')
  fill_in 'name', with: 'Ben Jones'
  fill_in 'email address', with: 'test@gmail.com'
  fill_in 'password', with: '123'
  click_button 'sign up'
end