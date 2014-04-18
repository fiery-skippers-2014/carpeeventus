require 'spec_helper'

describe Location do
  it {should belongs_to :user}
  it {should validate_uniqueness_of(:latitude)}
  it {should validate_uniqueness_of(:longitude)}
end
