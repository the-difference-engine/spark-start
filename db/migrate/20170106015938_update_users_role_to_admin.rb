class UpdateUsersRoleToAdmin < ActiveRecord::Migration[5.0]
  def down
    remove_column :users, :role, :string
  end

  def up
    add_column :users, :admin, :boolean, default: false
  end
end
