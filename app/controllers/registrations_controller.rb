class RegistrationsController < Devise::RegistrationsController

  def create



    respond_to do |format|
      format.html {
        super
      }
      format.json {
        @user = User.create(user_params)
        item = "test"
        render :json => item.to_json
      }
    end
  end

private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end 