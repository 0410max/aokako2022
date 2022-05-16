require 'test_helper'

class Public::NokakomonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_nokakomons_index_url
    assert_response :success
  end

end
