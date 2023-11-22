class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: [:show, :update_role]

  # Users can see their own profile and other users' profiles.
  def index
    @employees = policy_scope(User)
    authorize @employees
  end

  def show
    authorize @employee
  end

  # But only admins can update and remove roles.
  def update_role
    authorize @employee

    if @employee.update(user_params)
      redirect_to employees_path, notice: "Employee updated successfully." # Updates role in `users` table
    else
      render :index, status: :unprocessable_entity
    end
  end

  # Make a user a lead developer
  # def make_lead
  #   @employee.lead_developer!
  # end

  private

  def user_params
    policy = UserPolicy.new(current_user, @employee)
    params.require(:user).permit(policy.permitted_attributes)
  end

  def set_employee
    @employee = User.find(params[:id])
  end
end
