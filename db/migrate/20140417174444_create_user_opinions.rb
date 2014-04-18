class CreateUserOpinions < ActiveRecord::Migration
  def change
     create_table :useropinions do |t|
      t.string :feedback
      t.belongs_to :event
      t.belongs_to :user
      t.timestamps
  end
end
