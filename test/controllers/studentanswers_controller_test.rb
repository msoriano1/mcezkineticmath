require 'test_helper'

class StudentanswersControllerTest < ActionController::TestCase
  setup do
    @studentanswer = studentanswers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:studentanswers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create studentanswer" do
    assert_difference('Studentanswer.count') do
      post :create, studentanswer: {  }
    end

    assert_redirected_to studentanswer_path(assigns(:studentanswer))
  end

  test "should show studentanswer" do
    get :show, id: @studentanswer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @studentanswer
    assert_response :success
  end

  test "should update studentanswer" do
    patch :update, id: @studentanswer, studentanswer: {  }
    assert_redirected_to studentanswer_path(assigns(:studentanswer))
  end

  test "should destroy studentanswer" do
    assert_difference('Studentanswer.count', -1) do
      delete :destroy, id: @studentanswer
    end

    assert_redirected_to studentanswers_path
  end
end
