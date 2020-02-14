class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record.to_model
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destoy
    user.admin?
  end
end
