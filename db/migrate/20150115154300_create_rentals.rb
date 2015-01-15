class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.references :user, index: true
      t.datetime :start
      t.datetime :end
      t.boolean :picked_up
      t.boolean :active

      t.timestamps null: false
    end
    add_foreign_key :rentals, :users
  end
end
