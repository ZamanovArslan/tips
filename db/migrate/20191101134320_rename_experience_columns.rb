class RenameExperienceColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :experiences, :expertise, :experience
    rename_column :experiences, :expertise_ext, :experience_ext
    rename_column :tips, :expertise, :experience
    rename_column :tips, :expertise_ext, :experience_ext
  end
end
