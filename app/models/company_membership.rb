class CompanyMembership < ApplicationRecord
  ROLES = %w[member owner].freeze

  scope :owner, ->(user) { where(user: user, role: :owner) }

  belongs_to :user
  belongs_to :company

  has_many :tips, through: :user

  validates :role, inclusion: { in: ROLES }
end
