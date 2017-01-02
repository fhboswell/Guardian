class Api::V1::HomeController < Api::V1::AuthenticationController
	before_filter :authenticate_request!
  def index
  	render json: {'logged_in' => true}
  end
end