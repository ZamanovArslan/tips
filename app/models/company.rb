class Company < ApplicationRecord
  DEFAULT_NAME = "default"
  
  has_many :company_memberships, dependent: :destroy
  has_many :users, through: :company_memberships
  has_many :tips

  validates :name, uniqueness: { case_sensitive: false }

  paginates_per 10
end
