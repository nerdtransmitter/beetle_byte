class AddDefaultRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :role, from: nil, to: 2
  end
end
