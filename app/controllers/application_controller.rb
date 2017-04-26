class ApplicationController < ActionController::Base
  protect_from_forgery with: :reset_session

  before_filter :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :type_key)
    end
  end

  

end
