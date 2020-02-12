class CreateCompanyMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :company_memberships do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.string :role, null: false, default: :member

      t.timestamps
    end
  end
end
