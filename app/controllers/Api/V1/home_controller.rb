class Api::V1::HomeController < Api::V1::AuthenticationController
	 
  def index


  	item = Group.find(params[:id])
	item["message"] = "it works"
	
	render :json => item.to_json
  end
end