class AddReferencesToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :tip, foreign_key: true
  end
end
