require 'user' 

describe '.all' do
  it 'returns a list of user data' do
   enter_database

    users = User.all

    expect(users).to include{'fred@makersacademy.com'}
    expect(users).to include{'12345'}
    expect(users).to include{'Fred Smith'}
  end

  describe '.create' do
    it 'creates a new user account' do
      users = User.create(email: 'test@gmail.com', password: '9876', name: 'Benny Timsom')
      expect(users).to be_a User
      expect(users.email).to eq 'test@gmail.com'
      expect(users.name).to eq 'Benny Timsom'
    end

    it 'encrypts users password' do 

      expect(BCrypt::Password).to receive(:create).with('9876')
      users = User.create(email: 'test@gmail.com', password: '9876', name: 'Benny Timsom')
      
    end 
  end

  
end