require 'test_helper'

class Admin::BoardreportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_boardreports_index_url
    assert_response :success
  end

end
