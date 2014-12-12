class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.needs_verification!
      session[:id] = @user.id
      redirect_to root_path,
        notice: "Thank you for signing up #{@user.first_name.titleize}"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
    :first_name, :last_name, :email, :username, :password, :omniauth
    )
  end
end
