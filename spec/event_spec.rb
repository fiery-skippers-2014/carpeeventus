require 'spec helper'

describe Event do
  it {should belongs_to :user}
end