class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def create?
    user.admin? || user.project_manager?
  end

  def update?
    user.admin? || user.project_manager?
  end

  def destroy?
    user.admin? || user.project_manager?
  end
end
