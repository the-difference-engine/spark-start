class CreateAuthorsBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :authors_books do |t|
      t.integer :author_id
      t.integer :book_id
      t.timestamps
    end
  end
end
