class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :duration
      t.integer :party_size
      t.date :start_date
      t.date :end_date
      t.float :total_cost
      t.timestamps
    end
  end
end
