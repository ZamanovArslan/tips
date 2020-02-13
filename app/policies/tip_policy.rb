class TipPolicy < ApplicationPolicy
  def show
    record.user == user || user.companies.include?(record.company) || super
  end
end
