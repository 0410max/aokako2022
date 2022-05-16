require 'test_helper'

class Public::BoardreportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_boardreports_index_url
    assert_response :success
  end

end
