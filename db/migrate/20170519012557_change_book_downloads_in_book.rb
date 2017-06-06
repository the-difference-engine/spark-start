class ChangeBookDownloadsInBook < ActiveRecord::Migration[5.0]
  def change
    change_column_default :books, :book_downloads, 0
  end
end
