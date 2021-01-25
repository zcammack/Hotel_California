class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :size
      t.boolean :wifi
      t.boolean :breakfast
      t.string :accessibility

      t.timestamps
    end
  end
end
