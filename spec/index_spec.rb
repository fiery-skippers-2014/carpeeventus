require 'spec_helper'

describe 'On the Home page'  do
  it 'Should detect a carpe button exists' do
    get '/'
    expect(last_response.body).to include("Carpe")
  end
end

describe 'On the profile page' do
  before(:each) do
    user = User.create(name: 'test', email: 'test@test.com', password: 'password')
    Location.create(latitude: "-50.66", longitude: "-166.77", user_id: user.id)
    Event.create(name: "WillyNilly", user_id: user.id, end_date:"2018-04-17 20:30:00")
    Event.create(name: "LongGone", user_id: user.id, end_date:"2012-04-17 20:30:00")
  end

  after(:each) do
    User.destroy_all
    Location.destroy_all
    Events.destroy_all
  end

  it 'Should detect Locations are listed' do
    get '/user/1'
    expect(last_response.body).to include("-166.77")
  end

  it 'Should detect events that are upcoming' do
    get '/user/1'
    expect(last_response.body).to include("WillyNilly")
  end

  it 'Should detect events that are in the past' do
    get '/user/1'
    expect(last_response.body).to include("LongGone")
  end

end

