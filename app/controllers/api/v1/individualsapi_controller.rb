module Api
  module V1

	  class IndividualsapiController < AuthenticationController
	 	
		

		def index

          item = Group.find(params[:groupsapi_id])
          item = item.individuals
		  		
		  render :json => item.to_json
	    end

	    def show
			
	  	  item =  Group.where(user_ id: current_user)
		
		  render :json => item.to_json
		end 

		def change
		  @individual = Individual.find(params[:id])
		  item = "error"
		  if @individual.check == "No"
			@individual.update_attribute(:check, "Yes")
			item = "Done"
		  else
			@individual.update_attribute(:check, "No")
			item = "Done"
		  end
		  
		  render :json => item.to_json

		end

	private

		def set_group
			@group = Group.find(params[:groupapi_id])
		end

		def set_individual
			@individual = @group.individuals.find(params[:id])
		end

		def individual_params
			params[:individual].permit(:name).merge(check: "No")
		end


	  end
	end
end

