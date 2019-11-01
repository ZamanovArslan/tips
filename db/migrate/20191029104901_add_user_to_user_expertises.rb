class AddUserToUserExpertises < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_expertises, :user, foreign_key: true
  end
end
