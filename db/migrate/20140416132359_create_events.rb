class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.boolean :attended, default: false
      t.string :title
      t.string :address
      t.string :start_date
      t.string :end_date
      t.belongs_to :user
      t.timestamps
    end
  end
end
