class AddDefaultValueToActiveAttribute < ActiveRecord::Migration
  def change
  	change_column :rentals, :active, :boolean, :default => true
  end
end
