require 'rails_helper'

RSpec.describe Address, type: :model do
  
  it 'is valid with valid attributes' do
    justin = Account.create(username: 'Justin', password: 'batman', email: 'therealbatman@gmail.com')
    address = justin.addresses.create(street_number: 123, street_name: 'Sesame Street', city: 'Chicago', state: 'IL', zip: 34567, account_id: 1)
    expect(address).to be_valid
  end

  it 'is not valid without a street number' do
    ron = Account.create(username: 'Ronald', password: 'robinbird', email: 'robin@gmail.com')
    address = ron.addresses.create(street_name: 'Sesame Street', city: 'Chicago', state: 'IL', zip: 34567, account_id: 2)
    expect(address.errors[:street_number]).to_not be_empty
  end

  it 'is not valid without a street name' do
    ron = Account.create(username: 'Ronald', password: 'robinbird', email: 'robin@gmail.com')
    address = ron.addresses.create(street_number: 123, city: 'Chicago', state: 'IL', zip: 34567, account_id: 2)
    expect(address.errors[:street_name]).to_not be_empty
  end

  it 'is not valid without a city' do
    ron = Account.create(username: 'Ronald', password: 'robinbird', email: 'robin@gmail.com')
    address = ron.addresses.create(street_number: 123, street_name: 'Sesame Street', state: 'IL', zip: 34567, account_id: 2)
    expect(address.errors[:city]).to_not be_empty
  end

  it 'is not valid without a state' do
    ron = Account.create(username: 'Ronald', password: 'robinbird', email: 'robin@gmail.com')
    address = ron.addresses.create(street_number: 123, street_name: 'Sesame Street', city: 'Chicago', zip: 34567, account_id: 2)
    expect(address.errors[:state]).to_not be_empty
  end

end
