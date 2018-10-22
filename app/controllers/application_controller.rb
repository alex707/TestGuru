class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    current_user.is_a?(Admin) ? admin_tests_path : tests_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :first_name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :first_name, :email])
  end

end
