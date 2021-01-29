class ChangeAgeToBeIntegerInTenants < ActiveRecord::Migration[6.0]
  def change
    change_column :tenants, :age, :integer
  end
end
