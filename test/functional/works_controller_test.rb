require 'test_helper'

class WorksControllerTest < ActionController::TestCase
  setup do
    @work = works(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:works)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:authors)
  end

  test "should create work" do
    assert_difference('Work.count') do
      post :create, :work => @work.attributes
    end

    assert_redirected_to work_path(assigns(:work))
  end

  test "should show work" do
    get :show, :id => @work.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @work.to_param
    assert_response :success
    assert_not_nil assigns(:work)
    assert_not_nil assigns(:authors)
  end

  test "should update work" do
    put :update, :id => @work.to_param, :work => @work.attributes
    assert_redirected_to work_path(assigns(:work))
  end

  test "should destroy work" do
    assert_difference('Work.count', -1) do
      delete :destroy, :id => @work.to_param
    end

    assert_redirected_to works_path
  end
end
