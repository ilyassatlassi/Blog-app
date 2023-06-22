class ApplicationController < ActionController::Base
  # def current_user
  #   @current_user ||= User.first
  # end
  protect_from_forgery with: :exception

  before_action :authenticate_user!,:configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
