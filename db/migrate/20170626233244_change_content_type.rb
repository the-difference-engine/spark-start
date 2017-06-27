class ChangeContentType < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :data, :jsonb, null: false, default: {}
    add_index  :questions, :data, using: :gin
  end
end
