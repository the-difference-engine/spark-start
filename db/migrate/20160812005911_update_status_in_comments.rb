class UpdateStatusInComments < ActiveRecord::Migration[5.0]
  def change
  	change_column :comments, :approved, :boolean, default: false
  end
end
