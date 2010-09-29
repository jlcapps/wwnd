require 'test_helper'

class InterrogatorControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, :chunk_interrogator => { :slug => "nietzsche" } 
    assert_response :success
  end
end
