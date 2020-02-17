class CompanyMembership < ApplicationRecord
  ROLES = %w[member owner].freeze

  scope :owned_accounts, ->(user) { where(role: :owner, user: user) }

  belongs_to :user
  belongs_to :company

  has_many :tips, through: :user

  validates :role, inclusion: { in: ROLES }
  validates :user_id, uniqueness: { scope: :company_id }
end
