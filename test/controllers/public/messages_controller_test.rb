require 'test_helper'

class Public::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_messages_index_url
    assert_response :success
  end

  test "should get show" do
    get public_messages_show_url
    assert_response :success
  end

end
