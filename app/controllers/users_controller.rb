class UsersController < ApplicationController
  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_profile_params)
      flash[:notice] = t('.edit_profile.updated_successful')

      redirect_to users_edit_profile_path
    else
      render 'edit_profile'
    end
  end

  private

  def user_profile_params
    params.require(:user).permit(:name, :avatar)
  end
end
