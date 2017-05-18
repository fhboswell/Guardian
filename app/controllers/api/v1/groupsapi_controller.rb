module Api
  module V1

	  class GroupsapiController < AuthenticationController
	 	before_action :authenticate_request!
	 	
		def show
			
	  		item =  Group.where(user_id: current_user)
		
			render :json => item.to_json
		end 
		def create
    		@group = current_user.groups.build(group_params)
    		@group.save
    		puts "here"
    	end

    	private
	  		def group_params
    			params.require(:group).permit(:title, :description, :instructor, :location, :time)
  			end



	  end
	end
end

