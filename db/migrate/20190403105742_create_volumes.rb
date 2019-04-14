class CreateVolumes < ActiveRecord::Migration[5.1]
  def change
    create_table :volumes do |t|
      t.string :name
      t.timestamps
    end
  end
end
