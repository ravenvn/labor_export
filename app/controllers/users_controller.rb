class UsersController < ApplicationController
  def edit_profile
    @user = current_user
  end
end
