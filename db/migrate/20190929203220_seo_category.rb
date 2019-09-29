class SeoCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :seo_name, :string
  end
end
