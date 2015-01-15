class AddClothingToRental < ActiveRecord::Migration
  def change
    add_reference :rentals, :clothing, index: true
    add_foreign_key :rentals, :clothings
  end
end
