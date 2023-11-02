class UsersController < ApplicationController
  before_action :authenticate_user!

  # Only admins can update and remove roles.
  # But users can see their own profile and other users' profiles.
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def index
    @users = policy_scope(User)
    authorize @users
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update(user_params)
      redirect_to employee_path(@user), notice: "User updated successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    policy = UserPolicy.new(current_user, @user)
    params.require(:user).permit(policy.permitted_attributes)
  end
end
