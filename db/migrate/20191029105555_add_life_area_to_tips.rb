class AddLifeAreaToTips < ActiveRecord::Migration[5.1]
  def change
    add_reference :tips, :life_area, foreign_key: true
  end
end
