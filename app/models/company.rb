class Company < ApplicationRecord
  has_many :company_memberships, dependent: :destroy
  has_many :users, through: :company_memberships
  has_many :owners_accounts, -> { owner }, class_name: "CompanyMembership"
  has_many :owners, source: :user, through: :owners_accounts
  has_many :tips

  validates :name, uniqueness: { case_sensitive: false }, presence: true

  paginates_per 10
end
