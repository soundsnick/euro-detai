class ChangeParts < ActiveRecord::Migration[5.1]
  def change
    change_column :parts, :year, :text
  end
end
