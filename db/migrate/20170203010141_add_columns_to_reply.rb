class AddColumnsToReply < ActiveRecord::Migration[5.0]
  def change
    add_column :replies, :comment_id, :integer
    add_column :replies, :body, :text
  end
end
