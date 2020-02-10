class UserPolicy < ApplicationPolicy
  def admin_panel
    record.admin?
  end
end
