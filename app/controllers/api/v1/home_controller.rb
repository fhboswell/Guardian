

module Api
  module V1
	class HomeController < AuthenticationController
	  before_action :authenticate_request!
	  def index


	  	item = Group.find(params[:id])
		item["message"] = "it works"
		
		render :json => item.to_json
	  end
	end
end
end
