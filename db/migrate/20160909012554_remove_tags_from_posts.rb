class RemoveTagsFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :tags, :string
  end
end
