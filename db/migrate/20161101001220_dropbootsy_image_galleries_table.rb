class DropbootsyImageGalleriesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :bootsy_image_galleries do |t|
      t.string :bootsy_resource_type, null: false
      t.integer :bootsy_resource_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps null: false
    end
  end
end
