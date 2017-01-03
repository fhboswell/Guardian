 class Api::V1::GroupsController < Api::V1::AuthenticationController
 	
	def show
		
  	item = Group.find(params[:id])
	
	render :json => item.to_json
	end 
end