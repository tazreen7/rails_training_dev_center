require 'simplecov'
SimpleCov.start
require 'test_helper'

class AssociateTest < ActionDispatch::IntegrationTest
#setup test to create the associates
  def setup
    @associate =User.create!(leave_approval: "hh", start_date:"2019-10-09", end_date:"2019-10-30", type_of_request:"Work From Home")
@user=@associate.users.build(email:"taz@cerner.com",encrypted_password:"123456")
@user.save
end
# To move the root to index action
  test "should get associates index" do
  get associates_path
assert_response :success
  end
  #display list of all associate details in index
  test "should get associates listing" do
  get associates_path
assert_match @
  end
end
