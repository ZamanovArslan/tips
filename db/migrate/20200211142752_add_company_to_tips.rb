class AddCompanyToTips < ActiveRecord::Migration[5.1]
  def change
    add_reference :tips, :company, foreign_key: true
  end
end
