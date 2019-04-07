class UserPolicy < ApplicationPolicy
  def index
    user.admin? || user.mod?
  end
  def show
    record.user_id == user.id || user.admin? || user.mod?
  end
  def update
    record.id == user.id || user.admin?
  end
  def destroy
    user.admin? || record.user_id == user.id
  end
end
