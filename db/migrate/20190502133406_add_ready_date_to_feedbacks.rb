class AddReadyDateToFeedbacks < ActiveRecord::Migration[5.1]
  def change
    add_column :feedbacks, :ready_date, :string
  end
end
