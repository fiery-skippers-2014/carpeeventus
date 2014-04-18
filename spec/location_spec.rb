require 'spec_helper'

describe Location do
  it "should identify location of user when loggin into index" do
    location = get ('/location', {position: [3948394893,48398439]})
    expect location
  end
end
