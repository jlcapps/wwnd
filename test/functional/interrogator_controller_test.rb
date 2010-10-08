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
    assert assigns(:photo)
  end

  test "should get bio" do
    get :bio, :slug => "nietzsche"
    assert_response :success
  end

  test "should assign title" do
    get :index, :slug => "nietzsche"
    assert assigns(:title)
  end

  test "should get root" do
    get :root
    assert_response :success
    assert assigns(:authors), "No @authors assigned!"
  end
end
