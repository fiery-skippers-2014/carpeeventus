require 'spec_helper'

describe Event do
  it {should belongs_to :user}
end