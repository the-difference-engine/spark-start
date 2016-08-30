class AddInformationToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :state, :string
    add_column :profiles, :city, :string
  end
end
