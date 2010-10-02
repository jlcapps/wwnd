require 'test_helper'

class InterrogatorControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, :slug => "nietzsche"
    assert_response :success
  end

  test "should assign author_name" do
    get :index, :slug => "nietzsche"
    assert assigns(:author_name)
  end

  test "should assigns photo" do
    get :index, :slug => "nietzsche"
    assigns assigns(:photo)
  end
end
