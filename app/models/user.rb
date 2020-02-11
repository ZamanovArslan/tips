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

  def admin?
    role == "admin"
  end

  private

  def self.find_for_authentication(warden_conditions)
    user = find_by(:email => warden_conditions[:email])

    return user if user.admin?

    CompanyMembership.find(company: Company.find_by(name: warden_conditions[:subdomain]),
                            user: user).user
  end
end
