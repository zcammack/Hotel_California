class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :wifi
      t.string :breakfast
      t.string :accessibility
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
