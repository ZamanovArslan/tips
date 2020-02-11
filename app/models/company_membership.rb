class CompanyMembership < ApplicationRecord
  ROLES = %w[member owner].freeze

  scope :owner, ->(user) { where(user: user, role: :owner) }

  belongs_to :user
  belongs_to :company

  validates :role, inclusion: { in: ROLES }
end
