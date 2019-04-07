class UserPolicy < ApplicationPolicy
  def index
    user.admin? || user.mod?
  end
  def show
    rrecord.try(:user) == user || user.admin? || user.mod?
  end
  def update
    record.try(:user) == user || user.admin?
  end
  def destroy
    user.admin? || record.try(:user) == user
  end
end
