class AddAuthorAndDescriptionToBooks < ActiveRecord::Migration[5.0]
  def change
  	add_column :books, :author, :string
  	add_column :books, :description, :text
  end
end
