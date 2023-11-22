class UserPolicy < ApplicationPolicy
  attr_reader :user, :user_to_update

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, user_to_update)
    @user = user
    @user_to_update = user_to_update
  end

  def index?
    user.admin?
  end

  def show?
    # user.admin? || user == record
    true
  end

  def update?
    user == user_to_update || user.admin?
  end

  # Users can update their profile except for role, which is only for admins.
  def permitted_attributes
    if user.admin? || user.project_manager?
      [:role]
    else
      [:first_name, :last_name, :email, :password, :password_confirmation]
    end
  end
end
