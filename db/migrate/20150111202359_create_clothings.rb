class CreateClothings < ActiveRecord::Migration
  def change
    create_table :clothings do |t|
      t.string :clothing_code
      t.string :clothing_type
      t.string :gender
      t.string :color
      t.string :size

      t.timestamps null: false
    end
  end
end
