class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show edit update destroy close_ticket]
  before_action :set_project, only: %i[index new create edit update]
  before_action :authorize_ticket, only: %i[new create show edit update destroy]

  def new
    @ticket = Ticket.new
    @ticket.project = @project
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.created_by = current_user

    if @ticket.save
      redirect_to tickets_path, notice: "Your ticket was saved."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  # def index # This is the index of all tickets for a project
  #   @tickets = policy_scope(Ticket)
  # end
  def index
    authorize @project, :show?
    @tickets = @project.tickets
  end

  def all_tickets # This is the index of all tickets for all projects
    @tickets = policy_scope(Ticket)
    authorize @tickets

    render :index
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      # Check if any attributes have changed
      update_ticket_by_current_user
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
  end

  def close_ticket
    close_ticket_with_time if params[:ticket][:status] == 3
    if @ticket.update(ticket_close_params)
      redirect_to @ticket, notice: 'Ticket was successfully closed.'
    else
      render :edit
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:summary, :details, :created_by_id, :project_id, :dev_id, :status, :priority)
  end

  def set_ticket
    @ticket = Ticket.find_by(id: params[:id])
    redirect_to tickets_path, alert: 'Ticket not found' unless @ticket
  end

  def set_project
    @project = Project.find_by(id: params[:project_id])
    redirect_to tickets_path, alert: 'Project not found' unless @project
  end

  def authorize_ticket
    authorize @ticket
  end

  def update_ticket_by_current_user
    if @ticket.saved_changes?
      @ticket.updated_by = current_user
      @ticket.save
    end
  end

  def ticket_close_params
    params.require(:ticket).permit(:status, :resolution_summary)
  end

  # A separate method to update the completed_on attribute when the ticket is closed
  def close_ticket_with_time
    @ticket.completed_on = Time.current
  end
end
