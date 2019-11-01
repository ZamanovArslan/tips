class RenameUserExpertisesToExperiences < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_expertises, :experiences
  end
end
