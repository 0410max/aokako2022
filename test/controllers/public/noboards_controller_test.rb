require 'test_helper'

class Public::NoboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_noboards_index_url
    assert_response :success
  end

end
