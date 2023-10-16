class ProjectsController < ApplicationController
  def create
    @project = Project.new(project_params)
    @project.created_by = current_user

    if @project.save
      redirect_to projects_path, notice: "Your project was saved"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
  end

  def update
    @project = Project.find(params[:id])

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
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path, status: :see_other
  end

  private

  def project_params
    params.require(:title, :description).permit(:start_date, :target_date, :actual_end_date)
  end
end
