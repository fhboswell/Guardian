

module Api
  module V1
  	class DashboardapiController < AuthenticationController
  	 	before_action :authenticate_request!



  	  def index

  	  	 @objArray = Array.new
    		@user = User.where(id: current_user)
    		s = current_user.individualid[0]
      	@object = JSON.parse(s)
      	set_group
      	set_individual
      	@objArray << @individual
        @objArray << @group
  		  render :json => @objArray.to_json


  	  end


      def fileurl

        respond_to do |format|
      
          format.json {
            puts "in method"

            current_user.update_attribute(:selfieurl, params[:fileurl])
            puts params[:fileurl]
          }
        end

      end
      def actionReq

        respond_to do |format|
      
          format.json {
            puts "in method"

            current_user.update_attributes(set_actionReq)
            
            puts params[:set_actionReq]
          }
        end

      end



  	private
  	  def set_group
      	@group = Group.find(@object["groupid"])
    	  end

   	  def set_individual
      	@individual = @group.individuals.find(@object["individualid"])
      end

      def set_actionReq
       
          params.require(:user).permit(:actionreq, :name, :title)
        
      end
      

	  
	  end
  end
end

