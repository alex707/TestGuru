class ApplicationController < ActionController::Base
  helper_method :current_user,
                :logged_id?

  private

  def authenticate_user!
    unless current_user
      cookies[:last_path] = request.path
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_id?
    current_user.present?
  end
end
