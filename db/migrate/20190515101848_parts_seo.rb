class PartsSeo < ActiveRecord::Migration[5.1]
  def change
    add_column :parts, :meta_keywords, :text
    add_column :parts, :meta_description, :text
  end
end
