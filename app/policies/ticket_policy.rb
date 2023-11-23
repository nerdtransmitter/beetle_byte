class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.admin? || user.role == 0

      if user_lead_dev_projects.any?
        # Users with lead_dev role can see tickets in their lead_dev projects
        scope.where(project_id: user_lead_dev_projects)
      else
        # Regular users can see only their own tickets
        user_tickets
      end
    end

    private

    def user_tickets
      scope.where('created_by_id = :user_id OR dev_id = :user_id', user_id: user.id)
    end

    def user_lead_dev_projects
      # Retrieve the IDs of projects where the user is the lead developer
      Project.where(lead_dev_id: user.id).pluck(:id)
    end
  end

  def show?
    user.admin? || user.id == ticket.dev_id || user.id == ticket.project.lead_dev_id || user.role == 0
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
    user.admin? || user.id == ticket.dev_id || user.id == ticket.project.lead_dev_id || user.id == ticket.project.manager_id
  end

  def change_status?
    user.admin? || user.id == ticket.dev_id || user.id == ticket.project.lead_dev_id || user.id == ticket.project.manager_id
  end

  def destroy?
    user.admin? || user.role == 0 || ticket.created_by_id == user.id
  end

  def close_ticket?
    user.admin? || user.id == ticket.dev_id || user.id == ticket.project.lead_dev_id || user.id == ticket.project.manager_id
  end

  private

  def ticket
    record
  end
end
