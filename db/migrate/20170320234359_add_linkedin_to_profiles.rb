class AddLinkedinToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :linkedin_url, :string
  end
end
