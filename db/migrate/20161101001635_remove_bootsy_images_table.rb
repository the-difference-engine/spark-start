class RemoveBootsyImagesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :bootsy_images do |t|
      t.string :image_file, null: false
      t.integer :image_gallery_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps null: false
    end
  end
end
