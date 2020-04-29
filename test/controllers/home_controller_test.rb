require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get please_confirm" do
    get home_please_confirm_url
    assert_response :success
  end

end
