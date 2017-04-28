module Api
  module V1

	  class IndividualsapiController < AuthenticationController
	 	before_filter :authenticate_request!
	 	before_action :set_group
	 	
		

		def index

          item = Group.find(params[:groupsapi_id])
          item = item.individuals
		  		
		  render :json => item.to_json
	    end

	    def show
			
	  	  item =  Group.where(user_ id: current_user)
		
		  render :json => item.to_json
		end 

		def create
		
			@individual = @group.individuals.create(individual_params)
			@user = User.create(new_user_params)
	        @user.save
	        @user.send_reset_password_instructions
	        data = { 'groupid' => @group.id, 'individualid' => @individual.id}
	        @user.individualid = data.to_json
	        @user.save
    	end

		def change
		  @individual = Individual.find(params[:id])
		  item = {:hello => "no"}
		  if @individual.check == "No"
			@individual.update_attribute(:check, "Yes")
			ActionCable.server.broadcast 'room_channel',
                                   content:  "Yes",
                                   username: @individual.name,
                                   id: @group.id
		  else
			@individual.update_attribute(:check, "No")
			ActionCable.server.broadcast 'room_channel',
                                   content:  "No",
                                   username: @individual.name,
                                   id: @group.id
		  end
		  render :json => item.to_json

		end

	private

		def set_group
			@group = Group.find(params[:groupsapi_id])
		end

		def set_individual
			@individual = @group.individuals.find(params[:id])
		end

		def individual_params
			params.require(:individual).permit(:name).merge(check: "No")
		end
		def new_user_params
			params.require(:individual).permit(:email).merge(password: "lollol", type_key: "Guardian")

	end


	  end
	end
end

