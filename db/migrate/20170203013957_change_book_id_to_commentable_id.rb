class ChangeBookIdToCommentableId < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :book_id, :commentable_id
    add_column :comments, :commentable_type, :string
  end
end
