module Api
  module V1

	  class GroupsapiController < AuthenticationController
	 	before_action :authenticate_request!
		def show
			
	  	item =  Group.where(user_id: current_user)
		
		render :json => item.to_json
		end 


	  end
	end
end

