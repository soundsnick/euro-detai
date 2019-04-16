class ChangeCommentaries < ActiveRecord::Migration[5.1]
  def change
    add_column :commentaries, :user_id, :integer
    remove_column :commentaries, :name
  end
end
