class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :size
      t.string :wifi
      t.string :breakfast
      t.string :accessibility
      t.timestamps
    end
  end
end
