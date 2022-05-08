require 'test_helper'

class Public::KakomonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_kakomons_index_url
    assert_response :success
  end

  test "should get new" do
    get public_kakomons_new_url
    assert_response :success
  end

  test "should get show" do
    get public_kakomons_show_url
    assert_response :success
  end

  test "should get search" do
    get public_kakomons_search_url
    assert_response :success
  end

end
