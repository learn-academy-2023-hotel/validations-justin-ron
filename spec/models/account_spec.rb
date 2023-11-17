require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is valid with valid attributes' do
    justin = Account.create(username: 'Justin', password: 'batman', email: 'therealbatman@gmail.com')
    expect(justin).to be_valid
  end

  it 'is not valid without an username' do
    ron = Account.create(password: 'robinbird', email: 'robin@gmail.com')
    expect(ron.errors[:username]).to_not be_empty
  end 

  it 'is not valid without a password' do
    ron = Account.create(username: 'Ronald', email: 'robin@gmail.com')
    expect(ron.errors[:password]).to_not be_empty
  end

  it 'is not valid without an email' do
    justin = Account.create(username: 'Justin', password: 'batman')
    expect(justin.errors[:email]).to_not be_empty
  end

  it 'is not valid if username is less than 5 characters' do
    short = Account.create(username: 'shor', password: 'shorties', email: 'short@gmail.com')
    expect(short.errors[:username]).to_not be_empty
  end

  it 'is not valid with duplicate username' do
    justin = Account.create(username: 'Justin', password: 'batman', email: 'therealbatman@gmail.com')
    
    dupe = Account.create(username: 'Justin', password: 'bananas', email: 'thefakebatman@gmail.com')
    expect(dupe.errors[:username]).to_not be_empty
  end

  it 'is not valid if password is less than 6 characters' do
    shortp = Account.create(username: 'shortp', password: 'short', email: 'shortp@gmail.com')
    expect(shortp.errors[:password]).to_not be_empty
  end

  it 'is not valid with duplicate password' do
    justin = Account.create(username: 'Justin', password: 'batman', email: 'therealbatman@gmail.com')

    dupep = Account.create(username: 'dupep', password: 'batman', email: 'dupep@gmail.com')
    expect(dupep.errors[:password]).to_not be_empty
  end

  

end
