require "application_system_test_case"

class AssociatesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit 'associates/index'
  #
  #   assert_select "table", text: "Associates"
  # end

  test "creating an associate" do
  visit associate_path

  click_on "New Requests"

  fill_in "Reason", with: "Creating an Associate"
  fill_in "start_date", with: "Created this associate successfully!"
  fill_in "end_date", with: "Creating an Associate"
  fill_in "type_of_request", with: "Creating an Associate"
  click_on "Save"

  assert_text "Creating an Associate"
end
