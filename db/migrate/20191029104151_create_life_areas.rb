class CreateLifeAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :life_areas do |t|
      t.string :value, null: false
      t.string :en_value, null: false

      t.timestamps
    end
  end
end
