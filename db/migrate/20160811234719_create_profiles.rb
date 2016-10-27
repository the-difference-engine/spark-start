class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :experience
      t.text :bio
      t.string :phone
      t.string :career
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
