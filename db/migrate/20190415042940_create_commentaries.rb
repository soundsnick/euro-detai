class CreateCommentaries < ActiveRecord::Migration[5.1]
  def change
    create_table :commentaries do |t|
      t.string :name
      t.string :email
      t.text :text
      t.integer :new_id
      t.timestamps
    end
  end
end
