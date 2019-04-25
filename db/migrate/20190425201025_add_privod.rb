class AddPrivod < ActiveRecord::Migration[5.1]
  def change
    add_column :parts, :privod, :string
  end
end
