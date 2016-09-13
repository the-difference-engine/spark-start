class RemoveUserIdFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :user_id, :integer
    remove_column :chats, :user_id, :integer
    remove_column :posts, :user_id, :integer
    remove_column :profiles, :user_id, :integer
  end
end
