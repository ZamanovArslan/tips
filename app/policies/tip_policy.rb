class TipPolicy < ApplicationPolicy
  def show
    super || record.user == user || user.companies.include? record.company
  end
end
