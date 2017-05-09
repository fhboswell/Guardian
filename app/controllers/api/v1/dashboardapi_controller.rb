

module Api
  module V1
	class Dashboardapi_Controller < AuthenticationController
	  before_filter :authenticate_request!



	  def index


	  	item = "test"
		
		
		render :json => item.to_json
	  end

	  
	end
end
end

