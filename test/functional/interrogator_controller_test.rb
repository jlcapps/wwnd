require 'test_helper'

class InterrogatorControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, :slug => "nietzsche"
    assert_response :success
  end
end
