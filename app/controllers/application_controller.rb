class ApplicationController < ActionController::Base
  protect_from_forgery with: :exceptions
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    articles_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
