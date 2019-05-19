class CreateTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :texts do |t|
      t.string :action
      t.integer :counter
      t.text :content
    end
  end
end
