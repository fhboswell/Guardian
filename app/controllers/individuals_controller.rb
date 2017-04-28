class IndividualsController < ApplicationController

	before_action :set_group
	before_action :set_individual, except: [:create, :new]

	def create
		
		@individual = @group.individuals.create(individual_params)
		@user = User.create(new_user_params)
        @user.save
        @user.send_reset_password_instructions
        data = { 'photoid' => 123, 'photoname' => "asdasd", 'creator_id' => "asdasd" }
        @user.individualid = data.to_json
        @user.save


		redirect_to @group
	end



	def destroy
		
		if @individual.destroy
			flash[:success] = "Individual was deleted"
		else
			flash[:error] = "Individual was not deleted"
		end
	
	redirect_to @group
	end


	def change
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
		redirect_to @group


	end


	private

	def set_group
		@group = Group.find(params[:group_id])
	end

	def set_individual
		@individual = @group.individuals.find(params[:id])
	end

	def individual_params
		params[:individual].permit(:name, :email).merge(check: "No")
	end
	def new_user_params
		params[:individual].permit(:email).merge(password: "lollol")
	end
end
