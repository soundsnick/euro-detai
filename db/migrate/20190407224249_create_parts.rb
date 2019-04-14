class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.string :title
      t.string :image
      t.integer :manufacturer_id
      t.integer :model_id
      t.integer :year
      t.integer :volume_id
      t.string :mark
      t.string :constr_num
      t.integer :carcass_id
      t.integer :color_id
      t.text :description
      t.integer :fuel_id
      t.text :options
      t.integer :cost
      t.timestamps
    end
  end
end
