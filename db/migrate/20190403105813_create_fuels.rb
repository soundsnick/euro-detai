class CreateFuels < ActiveRecord::Migration[5.1]
  def change
    create_table :fuels do |t|
      t.string :name
      t.timestamps
    end
  end
end
