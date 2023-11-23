class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if user.has_role_or_admin?(:project_manager)

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
    user.has_role_or_admin?(:project_manager) || ticket_belongs_to_user? || user.id == ticket.project.lead_dev_id
  end

  def create?
    # Only the project lead or admin can create tickets
    return true if user.admin?
    user.id == ticket.project.lead_dev_id
  end

  def assign?
    # Only the project lead or admin can assign tickets
    return true if user.admin?
    user.id == ticket.project.lead_dev_id
  end

  def update?
    # Only the assigned developer, or the project lead, or admin can edit ticket details
    return true if user.admin?
    user.id == ticket.dev_id || user.id == ticket.project.lead_dev_id || user.id == ticket.project.manager_id
  end

  def change_status?
    return true if user.admin?
    user.id == ticket.dev_id || user.id == ticket.project.lead_dev_id || user.id == ticket.project.manager_id
  end

  def destroy?
    return true if user.admin?
    user.project_manager? || ticket.created_by_id == user.id
  end

  def close_ticket?
    return true if user.admin?
    user.id == ticket.dev_id || user.id == ticket.project.lead_dev_id || user.id == ticket.project.manager_id
  end

  private

  def ticket
    record
  end

  def ticket_belongs_to_user?
    ticket.created_by_id == user.id || ticket.dev_id == user.id
  end
end
