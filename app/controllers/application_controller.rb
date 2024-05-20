class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_permitted_parameters_edit, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def configure_permitted_parameters_edit
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end

end
