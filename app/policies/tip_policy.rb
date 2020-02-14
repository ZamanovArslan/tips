class TipPolicy < ApplicationPolicy
  def show?
    record.company.nil? || record.user == user || user.companies.include?(record.company) || super
  end
end
