require 'user'

describe '.all' do
  it 'returns a list of user data' do
   enter_database

    users = User.all

    expect(users).to include{'fred@makersacademy.com'}
    expect(users).to include{'12345'}
    expect(users).to include{'Fred Smith'}
  end
end