class ChangeSubcategories < ActiveRecord::Migration[5.1]
  def change
    add_column :subcategories, :name, :string
  end
end
