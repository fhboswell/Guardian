module Api
  module V1

	  class GroupsapiController < AuthenticationController
	 	
		def show
			
	  	item =  Group.where(user_id: current_user)
		
		render :json => item.to_json
		end 


	  end
	end
end

