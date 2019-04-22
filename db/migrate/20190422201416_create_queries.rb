class CreateQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :queries do |t|
      t.integer :manufacturer_id
      t.string :model
      t.integer :year
      t.integer :carcass_id
      t.integer :fuel_id
      t.string :volume
      t.string :power
      t.string :engine
      t.string :changer
      t.string :privod
      t.string :kpp
      t.string :part
      t.text :description
      t.string :name
      t.string :city
      t.string :email
      t.string :phone
      t.timestamps
    end
  end
end
