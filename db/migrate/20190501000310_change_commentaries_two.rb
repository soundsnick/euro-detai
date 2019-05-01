class ChangeCommentariesTwo < ActiveRecord::Migration[5.1]
  def change
    remove_column :commentaries, :user_id
    add_column :commentaries, :name, :string
  end
end
