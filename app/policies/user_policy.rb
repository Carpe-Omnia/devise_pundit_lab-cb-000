class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
  def show?
    record.id == user.id || user.admin? || user.mod?
  end
  def update?
    record == user || user.admin?
  end
  def destroy?
    user.admin? || record.try(:user) == user
  end
  def create?
    true
  end
end
