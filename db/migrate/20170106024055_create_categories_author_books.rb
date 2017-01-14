class CreateCategoriesAuthorBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_author_books do |t|
      t.integer :author_id
      t.integer :book_id
      t.integer :category_id
      t.timestamps
    end
  end
end
