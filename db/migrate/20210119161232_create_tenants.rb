class CreateTenants < ActiveRecord::Migration[6.0]
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.timestamps
    end
  end
end
