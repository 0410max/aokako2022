require 'test_helper'

class Admin::KakomonreportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_kakomonreports_index_url
    assert_response :success
  end

end
