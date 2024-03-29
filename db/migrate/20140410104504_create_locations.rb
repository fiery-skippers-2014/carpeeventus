class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string    :longitude
      t.string    :latitude
      t.string    :location
      t.string    :address
      t.belongs_to :user
      t.timestamps
    end
  end
end
