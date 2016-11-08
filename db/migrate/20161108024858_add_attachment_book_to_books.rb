class AddAttachmentBookToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :book
    end
  end

  def self.down
    remove_attachment :books, :book
  end
end
