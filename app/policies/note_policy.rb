class UserPolicy < ApplicationPolicy
  def index
    user.admin? || user.mod?
  end
  def show
    record.try(:user) == user || user.admin? || user.mod?
  end
  def update
    record.try(:user) == user || user.admin?
  end
  def destroy
    user.admin? || record.try(:user) == user
  end
  def create
    user.normal? || user.admin? || user.mod?
  end
end
