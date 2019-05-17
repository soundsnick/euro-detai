class CreateSeos < ActiveRecord::Migration[5.1]
  def change
    create_table :seos do |t|
      t.string :action
      t.string :title
      t.string :keywords
      t.text :description
    end
  end
end
