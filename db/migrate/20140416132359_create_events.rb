class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.boolean :attended
      t.string :title
      t.string :description
      t.string :address
      t.string :longitude
      t.string :latitude
      t.string :start_date
      t.string :end_date
      t.belongs_to :user
      t.timestamps
    end
  end
end
