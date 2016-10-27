class AddUserIdToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :user_id, :string
    add_column :chats, :user_id, :string
    add_column :posts, :user_id, :string
    add_column :profiles, :user_id, :string
  end
end
