class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])

    end
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  # def other_user
  #   @other_user = User.find(:id)
  # end

  def authorize
   if !current_user
    #  flash[:alert] = "You aren't authorized to visit that page."
     redirect_to '/'
   end
 end
end
