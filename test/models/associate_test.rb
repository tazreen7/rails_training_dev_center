require 'simplecov'
SimpleCov.start
require 'test_helper'

class AssociateTest < ActiveSupport::TestCase

  def setup
    @associate=Associate.new(leave_approval: "sick",start_date: "20-09-2012",end_date: "21-09-2012",type_of_request: "Vacation")
end
test "associates should be valid" do
  assert @associate.valid?
end
test "associates should be require reason" do
  @associate.leave_approval= ""
  assert_not @associate.valid?
end
test "associates should have start_date" do
  @associate.start_date= ""
  assert_not @associate.valid?
end
test "associates should have end_date" do
  @associate.end_date= ""
  assert_not @associate.valid?
end
test "associates should have leave type" do
  @associate.type_of_request= ""
  assert_not @associate.valid?
end

test "associates reason should not have more then 100 characters" do
  @associate.leave_approval= "a" * 101
  assert_not @associate.valid?
end

# test "associates end_date should be less then start_date" do
#   @associate.end_date= ""
#   assert_not @associate.valid?
# end

  # test "should not save associate without its parameters" do
  #   associate = Associate.new
  #   assert_not associate.save, "Saved the associate without parameters"
  # end
end
