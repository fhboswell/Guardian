module Api
  module V1

	  class IndividualsapiController < AuthenticationController
	 	
		

		def index

          item = Group.find(params[:groupsapi_id])
          item = item.individuals
		  		
		  render :json => item.to_json
	    end

	    def show
			
	  	  item =  Group.where(user_id: current_user)
		
		  render :json => item.to_json
		end 


	  end
	end
end

