
  class GroupsapiController < AuthenticationController
 	
	def show
		
  	item = Group.find(params[:id])
	
	render :json => item.to_json
	end 
  end
