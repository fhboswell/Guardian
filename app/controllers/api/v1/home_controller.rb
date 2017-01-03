class api::v1::HomeController < api::v1::AuthenticationController
	 
  def index


  	item = Group.find(params[:id])
	item["message"] = "it works"
	
	render :json => item.to_json
  end
end