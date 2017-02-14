class AddAttachmentEbookToBooks < ActiveRecord::Migration
  def up
    add_attachment :books, :ebook
  end

  def down
    remove_attachment :books, :ebook
  end
end
