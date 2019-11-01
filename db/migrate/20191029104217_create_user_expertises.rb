class CreateUserExpertises < ActiveRecord::Migration[5.1]
  def change
    create_table :user_expertises do |t|
      t.integer :expertise
      t.text :expertise_ext

      t.timestamps
    end
  end
end
