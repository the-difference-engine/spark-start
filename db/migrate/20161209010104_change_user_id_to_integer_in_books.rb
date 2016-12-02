class ChangeUserIdToIntegerInBooks < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
