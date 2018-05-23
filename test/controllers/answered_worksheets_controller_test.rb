require 'test_helper'

class AnsweredWorksheetsControllerTest < ActionController::TestCase
  setup do
    @answered_worksheet = answered_worksheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answered_worksheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answered_worksheet" do
    assert_difference('AnsweredWorksheet.count') do
      post :create, answered_worksheet: {  }
    end

    assert_redirected_to answered_worksheet_path(assigns(:answered_worksheet))
  end

  test "should show answered_worksheet" do
    get :show, id: @answered_worksheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @answered_worksheet
    assert_response :success
  end

  test "should update answered_worksheet" do
    patch :update, id: @answered_worksheet, answered_worksheet: {  }
    assert_redirected_to answered_worksheet_path(assigns(:answered_worksheet))
  end

  test "should destroy answered_worksheet" do
    assert_difference('AnsweredWorksheet.count', -1) do
      delete :destroy, id: @answered_worksheet
    end

    assert_redirected_to answered_worksheets_path
  end
end
