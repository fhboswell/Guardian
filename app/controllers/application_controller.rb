class ApplicationController < ActionController::Base
  

  before_action :configure_devise_params, if: :devise_controller?
  def configure_devise_params

    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :type_key)

    end
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  def after_sign_in_path_for(resource)
  # Here you can write logic based on roles to return different after sign in paths
	  if current_user.type_key == "Admin"
	    puts "Admin"
	    authenticated_root_path
	  elsif current_user.type_key == "Guardian"
	    puts "Guardian"
	    dashboard_index_path
	  end

  end
  

end
