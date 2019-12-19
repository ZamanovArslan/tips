class AddLikesCountToTips < ActiveRecord::Migration[5.1]
  def change
    add_column :tips, :likes_count, :integer
  end
end
