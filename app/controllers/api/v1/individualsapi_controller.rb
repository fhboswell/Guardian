module Api
  module V1

	  class IndividualsapiController < AuthenticationController
	 	
		before_action :set_group
	    before_action :set_individual, except: [:create]

		def index

          item = Group.find(params[:groupsapi_id])
          item = item.individuals
		  		
		  render :json => item.to_json
	    end

	    def show
			
	  	  item =  Group.where(user_id: current_user)
		
		  render :json => item.to_json
		end 

		def change

		  if @individual.check == "No"
			@individual.update_attribute(:check, "Yes")
		  else
			@individual.update_attribute(:check, "No")
		  end

		end

	private

		def set_group
			@group = Group.find(params[:group_id])
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

