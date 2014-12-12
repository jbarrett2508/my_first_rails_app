class SessionsController < ApplicationController
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      # user submitted valid password
      session[:user_id] = user.id
      redirect_to stats_path, notice: "Welcome back #{user.first_name.titleize}"
    else
      flash[:error] = "Invalid username or password. Please try again."
      render :login
    end
  end

  def destroy
    if user = current_user
      session[:id] = nil
      redirect_to root_path, notice: "#{user.username} has been logged out"
    end
  end

  def oauth
    @user = User.where(
      username: omniauth_options[:username]
    ).first_or_initialize(omniauth_options)
    if @user.persisted?
      session[:id] = @user.id
      redirect_to stats_path,
        notice: "Welcome back #{@user.first_name.titleize}."
    else
      render 'users/new'
    end
  end

  private
  def omniauth_options
    if auth_hash = request.env['omniauth.auth']
      first_name, last_name = auth_hash[:info][:name].split(/\s+/, 2)
      {
        email: auth_hash[:info][:email],
        first_name: first_name,
        last_name: last_name,
        omniauth: true
      }
    end
  end
end
