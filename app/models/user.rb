class User < ApplicationRecord
  ROLES = %w[user company_owner admin].freeze

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :full_name, presence: true
  validates :role, inclusion: { in: ROLES }

  has_many :tips
  has_many :experiences
  has_many :comments

  def admin?
    role == "admin"
  end
end
