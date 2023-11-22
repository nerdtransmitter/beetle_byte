class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        # Admins can see all tickets
        scope.all
      elsif user_lead_dev_projects.any?
        # Users with lead_dev role can see tickets in their lead_dev projects
        scope.where(project_id: user_lead_dev_projects)
      else
        # Regular users can see only their own tickets
        scope.where('created_by_id = ? OR dev_id = ?', user.id, user.id)
      end
    end

    private

    def user_lead_dev_projects
      # Retrieve the IDs of projects where the user is the lead developer
      Project.where(lead_dev_id: user.id).pluck(:id)
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
