class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_params
  before_action :set_user

def update
 
  if @user.update(user_params)
    puts 'the user info successfully updated' #add whatever you want
    puts @user.selfieurl
  else
    puts 'failed'
  end
  redirect_to after_sign_in_path_for(@user)
end

 private

 def user_params
   params.require(:user).permit(:selfieurl)
   

 end
 def set_user
     @user = User.find(params[:id])
     puts @user
 end
end