class AddBookDownloadsToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :book_downloads, :integer
    add_column :books, :max_downloads, :integer
  end
end
