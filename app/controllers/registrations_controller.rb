class RegistrationsController < Devise::RegistrationsController
  def create
    respond_to do |format|
      format.html {
        super
      }
       format.json {
        @user = User.create(user_params)
        puts user_params
        
        @user.save ? (render json: {:data => @user }, status: :created) : 
                     (render json: {:data => @user.errors.full_messages }, status: :conflict)
      }
    end
  end

private

    def user_params
      
      params.require(:user).permit(:email, :password, :type_key)

    end
  end 