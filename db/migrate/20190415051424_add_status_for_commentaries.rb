class AddStatusForCommentaries < ActiveRecord::Migration[5.1]
  def change
    add_column :commentaries, :status, :integer
  end
end
