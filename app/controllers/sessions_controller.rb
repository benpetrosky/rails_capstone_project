class SessionsController < ApplicationController

  before_action :authorize, only: [:secret]

	def secret
  end

  def create
    @user = User.authenticate(params[:name], params[:password])
    if @user

      flash[:notice] = "You've signed in."
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've signed out."
    redirect_to "/"
  end
end
