class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def create?
    # Only the project lead or admin can create tickets
    user.admin? || user.id == ticket.project.lead_dev_id
  end

  def assign?
    # Only the project lead or admin can assign tickets
    user.admin? || user.id == ticket.project.lead_dev_id
  end

  def update?
    # Only the assigned developer, or the project lead, or admin can edit ticket details
    user.admin? || user.id == ticket.dev_id || user.id == ticket.project.lead_dev_id
  end

  def change_status?
    # If a developer resolves the ticket, they should be able to change status
    user.admin? || user.id == ticket.dev_id || user.id == ticket.project.lead_dev_id
  end

  def destroy?
    user.admin? || user.role == 0 || user.role == 1
  end

  private

  def ticket
    record
  end
end
