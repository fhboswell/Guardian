require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end


  def setup
    @user = users(:example)
  end

  test "login page" do
    get new_user_session_path
    assert_response :success
  end
	test "login" do
  	post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
 
 	 assert_equal 200, status
  	
  
end

end
