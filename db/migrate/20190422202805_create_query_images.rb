class CreateQueryImages < ActiveRecord::Migration[5.1]
  def change
    create_table :query_images do |t|
      t.integer :query_id
      t.string :image
    end
  end
end
