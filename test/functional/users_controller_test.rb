require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end
  
  test "should not be able to delete myself" do
    #TODO - should not be able to delete myself if I'm the current_user
  end

end
