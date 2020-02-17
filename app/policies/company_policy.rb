class CompanyPolicy < ApplicationPolicy
  def have_access?
    user.admin? || record.nil? || user.companies(company: record).exists?
  end
end
