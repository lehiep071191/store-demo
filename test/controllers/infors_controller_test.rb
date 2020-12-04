require 'test_helper'

class InforsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get infors_show_url
    assert_response :success
  end

end
