

module Api
  module V1
	class HomeController < AuthenticationController
	  
	  def index


	  	item = "test"
		
		
		render :json => item.to_json
	  end
	end
end
end
