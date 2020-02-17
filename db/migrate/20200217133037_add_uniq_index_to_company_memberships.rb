class AddUniqIndexToCompanyMemberships < ActiveRecord::Migration[5.1]
  def change
    add_index :company_memberships, [:user_id, :company_id], unique: true
  end
end
