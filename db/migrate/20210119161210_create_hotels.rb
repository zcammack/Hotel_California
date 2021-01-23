class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :size
      t.integer :vacancies
      t.boolean :wifi
      t.boolean :breakfast
      t.string :accessibility
      t.timestamps
    end
  end
end
