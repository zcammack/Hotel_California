class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :occupancy
      t.boolean :vacant
      t.integer :floor_number
      t.boolean :clean
      t.boolean :smoking
      t.float :price_per_night
      t.timestamps
    end
  end
end
