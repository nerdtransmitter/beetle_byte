class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def create?
    user.admin? || user.role == 'Project Manager'
  end

  def update?
    user.admin? || user.role == 'Project Manager' 
  end

  def destroy?
    user.admin? || user.role == 'Project Manager' 
  end

  private

  def project
    @record = project
  end
end
