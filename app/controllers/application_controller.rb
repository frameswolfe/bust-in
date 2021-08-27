class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    toilets_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :profile_photo])
  end
end
