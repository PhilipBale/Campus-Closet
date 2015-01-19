class AddDefaultPickedUpToRental < ActiveRecord::Migration
  def change
  	change_column :rentals, :picked_up, :boolean, :default => false
  end
end
