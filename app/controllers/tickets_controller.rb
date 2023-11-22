class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show update edit destroy]
  before_action :set_project, only: %i[new create edit update]

  def new
    @ticket = Ticket.new
    @ticket.project = @project
    authorize @ticket, :new?
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.created_by = current_user
    authorize @ticket, :create?

    if @ticket.save
      redirect_to projects_path(@project), notice: "Your ticket was saved"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @ticket, :show?
  end

  def index
    @tickets = policy_scope(ticket) # ticket.all
    # @tickets = ticket.all
  end

  def edit
    authorize @ticket, :edit?
  end

  def update
    if @ticket.update(ticket_params)
      # Check if any attributes have changed
      if @ticket.saved_changes?
        @ticket.updated_by = current_user
        @ticket.save
      end
      redirect_to tickets_path, notice: "Your ticket was successfully updated"
    else
      # Handle validation errors or other issues
      render :new, status: :unprocessable_entity
    end
    authorize @ticket, :update?
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, status: :see_other
    authorize @ticket, :destroy?
  end

  private

  def ticket_params
    params.require(:ticket).permit(:summary, :details, :created_by_id, :project_id, :dev_id, :status, :priority)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
    authorize @ticket # For Pundit, authorize individual instances in other actions
  end

  def set_project
    @project = Project.find(params[:project_id])
    authorize @project # For Pundit, authorize individual instances in other actions
  end
end
