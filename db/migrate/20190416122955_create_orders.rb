class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.string :city
      t.string :email
      t.text :additional
      t.integer :part_id
    end
  end
end
