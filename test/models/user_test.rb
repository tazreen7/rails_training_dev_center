require 'simplecov'
SimpleCov.start
require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "email validation should trigger" do

  assert_not User.new(email: 'email',encrypted_password: 'password').save

end
test "user should have email" do
  @user.email= ""
  assert_not @associate.valid?
end
test "user should have password field" do
  @user.password= ""
  assert_not @associate.valid?
end
# test "user should save" do
#   assert User.new
# end
end
