class ApplicationController < ActionController::Base
  

  before_action :configure_devise_params, if: :devise_controller?
  def configure_devise_params

    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :type_key)

    end
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  

end
