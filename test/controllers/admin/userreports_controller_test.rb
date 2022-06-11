require 'test_helper'

class Admin::UserreportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_userreports_index_url
    assert_response :success
  end

end
