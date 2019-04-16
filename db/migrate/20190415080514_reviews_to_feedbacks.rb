class ReviewsToFeedbacks < ActiveRecord::Migration[5.1]
  def change
    rename_table :reviews, :feedbacks
  end
end
