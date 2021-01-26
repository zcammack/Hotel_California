class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.string :smoking
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
