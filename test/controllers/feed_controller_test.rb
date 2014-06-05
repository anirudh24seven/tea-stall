require 'test_helper'

class FeedControllerTest < ActionController::TestCase
  test "should get development" do
    get :development
    assert_response :success
  end

  test "should get design" do
    get :design
    assert_response :success
  end

  test "should get business" do
    get :business
    assert_response :success
  end

  test "should get growth" do
    get :growth
    assert_response :success
  end

end
