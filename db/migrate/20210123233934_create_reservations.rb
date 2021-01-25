class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :party_size
      t.date :start_date
      t.date :end_date
      t.references :room, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
