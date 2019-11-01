class CreateTips < ActiveRecord::Migration[5.1]
  def change
    create_table :tips do |t|
      t.string :title, null: false
      t.boolean :anonym, default: false
      t.text :description
      t.integer :expertise
      t.text :expertise_ext

      t.timestamps
    end
  end
end
