class Location < ActiveRecord::Base
  validates :latitude, uniqueness: true
  validates :longitude, uniqueness: true

  belongs_to :user
end
