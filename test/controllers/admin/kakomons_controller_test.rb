require 'test_helper'

class Admin::KakomonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_kakomons_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_kakomons_show_url
    assert_response :success
  end

end
