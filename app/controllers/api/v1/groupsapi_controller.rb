module Api
  module V1

	  class GroupsapiController < AuthenticationController
	 	before_action :authenticate_request!
		def show
			
	  	item = Group.find(params[:id])
		
		render :json => item.to_json
		end 


	  end
	end
end

