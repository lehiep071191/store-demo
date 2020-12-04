require 'test_helper'

class UpdateDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get update_details_update_url
    assert_response :success
  end

end
