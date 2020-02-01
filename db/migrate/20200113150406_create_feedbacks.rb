class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.text :email
      t.text :title
      t.text :message, null: false

      t.timestamps
    end
  end
end
