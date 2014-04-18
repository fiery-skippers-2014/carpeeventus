class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      # t.string :email
      t.string :facebook_id
      t.string :token
      t.string :distance
      t.string :category
      t.timestamps
    end
  end
end
