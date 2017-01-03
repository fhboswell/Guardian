 class api::v1::GroupsController < api::v1::AuthenticationController
 	
	def show
		
  	item = Group.find(params[:id])
	
	render :json => item.to_json
	end 
end