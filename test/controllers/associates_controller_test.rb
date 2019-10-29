require 'test_helper'

class AssociatesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post 'user_session_url'

  end
  test "should get index" do
    get :associates_index_path
    assert_response :success
  end
  test "should get new" do
    get '/associates/new'
    assert_response :success
  end
  # test "should create associate" do
  # assert_difference('Associate.count') do
  #   post associate_url, params: { associate: { leave_approval: 'Reason' } }
  # end


end
