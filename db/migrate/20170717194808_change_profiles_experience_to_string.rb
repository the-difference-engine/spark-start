class ChangeProfilesExperienceToString < ActiveRecord::Migration[5.0]
  def change
    change_column :profiles, :experience, :string
  end
end
