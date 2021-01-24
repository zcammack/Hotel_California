class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :occupancy
      t.boolean :vacant
      t.string :room_number
      t.boolean :smoking
      t.string :price_per_night
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
