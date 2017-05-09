

module Api
  module V1
	class DashboardapiController < AuthenticationController
	 	before_filter :authenticate_request!



	  def index

	  	 @objArray = Array.new
  		@user = User.where(id: current_user)
  		s = current_user.individualid[0]
    	@object = JSON.parse(s)
    	set_group
    	set_individual
    	@objArray << @individual
		render :json => @objArray.to_json


	  end
	private
	  def set_group
    	@group = Group.find(@object["groupid"])
  	  end

 	  def set_individual
    	@individual = @group.individuals.find(@object["individualid"])
      end

	  
	end
end
end

