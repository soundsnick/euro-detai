class CreateNewsSeos < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :meta_keywords, :string
    add_column :news, :meta_description, :text
  end
end
