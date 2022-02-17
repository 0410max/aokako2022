require 'test_helper'

class KakomonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kakomons_index_url
    assert_response :success
  end

end
