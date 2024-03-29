require 'spec_helper'

describe 'On the Home page'  do
  it 'Should detect a carpe button exists' do
    get '/'
    expect(last_response.body).to include("Optional")
  end
end

describe 'On the profile page' do
  before(:each) do
    @user = User.create(name: 'test')
    Location.create(latitude: "-50.66", longitude: "-166.77", user_id: @user.id)
    Event.create(title: "WillyNilly", user_id: @user.id, end_date:"2018-04-17 20:30:00")
    Event.create(title: "LongGone", user_id: @user.id, end_date:"2012-04-17 20:30:00")

  end

  after(:each) do
    User.destroy_all
    Location.destroy_all
    Event.destroy_all
  end

  it 'Should detect Locations are listed' do
    session = {:user_id => @user.id}
    get '/user/1', {}, 'rack.session' => session
    expect(last_response.body).to include("-166.77")
  end

  it 'Should detect events that are upcoming' do
    session = {:user_id => @user.id}
    get '/user/1', {}, 'rack.session' => session
    expect(last_response.body).to include("WillyNilly")
  end

  it 'Should detect events that are in the past' do
    session = {:user_id => @user.id}
    get '/user/1', {}, 'rack.session' => session
    expect(last_response.body).to include("LongGone")
  end

end

