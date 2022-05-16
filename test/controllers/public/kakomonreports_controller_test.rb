require 'test_helper'

class Public::KakomonreportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_kakomonreports_index_url
    assert_response :success
  end

end
