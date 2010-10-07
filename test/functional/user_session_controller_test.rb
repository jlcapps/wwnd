require 'test_helper'

class UserSessionControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should post login" do
    post :login, :user_session => { :login => "jlcapps", :password => "secret" }
    assert user_session = UserSession.find
    assert_equal users(:one), user_session.user
    assert_redirected_to "/authors"
  end

  test "should get logout" do
    post :login, :user_session => { :login => "jlcapps", :password => "secret" }
    get :logout
    assert_nil UserSession.find
    assert_redirected_to "/"
  end
end
