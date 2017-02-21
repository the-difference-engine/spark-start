class RemoveAuthorFromCategoriesAuthorBooks < ActiveRecord::Migration[5.0]
  def change
  	remove_column :categories_author_books, :author_id, :integer
  end
end
