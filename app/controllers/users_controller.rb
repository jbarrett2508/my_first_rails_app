class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.needs_verification!
      session[:id] = @user.id
      redirect_to profile_user_path(@user),
        notice: "Thank you for signing up #{@user.first_name.titleize}"
    else
      render :new, error: "Verification email could not be sent."
    end
  end

  def profile
    @profile = current_user.profile
    #@profile = Profile.where(user_id: current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(
    :first_name, :last_name, :email, :username, :password, :omniauth
    )
  end
end
