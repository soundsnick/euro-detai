class ChangeManufacturers < ActiveRecord::Migration[5.1]
  def change
    add_column :manufacturers, :image, :string
    add_column :manufacturers, :text, :text
  end
end
