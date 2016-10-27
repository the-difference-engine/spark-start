class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
