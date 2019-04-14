class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :country_id
      t.string :phone
      t.string :password
      t.timestamps
    end
  end
end
