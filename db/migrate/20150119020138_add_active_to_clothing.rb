class AddActiveToClothing < ActiveRecord::Migration
  def change
    add_column :clothings, :active, :boolean, :default => true
  end
end
