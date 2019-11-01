class AddLifeAreaToUserExpertises < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_expertises, :life_area, foreign_key: true
  end
end
