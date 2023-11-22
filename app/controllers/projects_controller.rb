class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[show update edit destroy]

  def new
    @project = Project.new
    authorize @project, :new?
    # @user = User.find(params[:user]) if params[:user]
  end

  def create
    @project = Project.new(project_params)
    @project.created_by = current_user
    authorize @project, :create?

    if @project.save
      redirect_to projects_path, notice: "Your project was saved"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @project, :show?
  end

  def index
    @projects = policy_scope(Project) # Project.all
  end

  def edit
    authorize @project, :edit?
  end

  def update
    if @project.update(project_params)
      # Check if any attributes have changed
      if @project.saved_changes?
        @project.updated_by = current_user
        @project.save
      end
      redirect_to projects_path, notice: "Your project was successfully updated"
    else
      # Handle validation errors or other issues
      render :new, status: :unprocessable_entity
    end
    authorize @project, :update?
  end

  def destroy
    @project.destroy
    redirect_to projects_path, status: :see_other
    authorize @project, :destroy?
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :target_date)
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project # For Pundit, authorize individual instances in other actions
  end
end
