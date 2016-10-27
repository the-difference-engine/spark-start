class ChangeNameInTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :name, :string
    add_column :tags, :tag_name, :string
  end
end
