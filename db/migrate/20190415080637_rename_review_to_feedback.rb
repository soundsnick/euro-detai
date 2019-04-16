class RenameReviewToFeedback < ActiveRecord::Migration[5.1]
  def change
    rename_table :feedbacks, :reviews
    rename_table :reviews, :feedbacks
  end
end
