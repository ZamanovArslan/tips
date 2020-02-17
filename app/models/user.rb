class User < ApplicationRecord
  ROLES = %w[user admin].freeze

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable, request_keys: { subdomain: false }

  validates :full_name, presence: true
  validates :role, inclusion: { in: ROLES }

  has_many :tips
  has_many :experiences
  has_many :comments
  has_many :company_memberships
  has_many :companies, through: :company_memberships
  has_many :owned_companies, through: :company_memberships, source: :company do
    -> { owned_accounts(self) }
  end

  def admin?
    role == "admin"
  end

  def self.find_for_authentication(warden_conditions)
    user = find_by(email: warden_conditions[:email])
    company = Company.find_by(name: warden_conditions[:subdomain])

    return user if !company || CompanyPolicy.new(self, company).have_access?
  end
end
