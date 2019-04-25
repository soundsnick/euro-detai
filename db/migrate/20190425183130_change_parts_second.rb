class ChangePartsSecond < ActiveRecord::Migration[5.1]
  def change
    add_column :parts, :tags, :text
    change_column :parts, :image, :text
  end
end
