require 'test_helper'

class UsersController < ActionDispatch::IntegrationTest
  setup do
    @user=users(:one)
  end
  # test "password should be atleast six characters" do
  #   post 'user_session_url'
  #   assert_response :success
  # end
  # test "should get new" do
  #   get /sessions/new
  #   assert_response :success
  # end
  # test "should get edit" do
  #   get '/associates/edit'
  #   assert_response :success
  # end

  test "should create user" do
    assert_difference('User.count') do
      post 'user_session_url',params: { users: {email: @user.email, password: @user.encrypted_password}}
    end
  end
end
