require 'test_helper'
require 'authlogic/test_case'

class UserSessionControllerTest < ActionController::TestCase
  setup :activate_authlogic

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
    UserSession.create(users(:one))
    get :logout
    assert_nil UserSession.find
    assert_redirected_to "/"
  end

  test "should not get logout if not logged in" do
    get :logout
    assert_redirected_to user_session_login_url
  end

  test "should not get login if logged in" do
    UserSession.create(users(:one))
    get :login
    assert_redirected_to "/authors"
   end
end
