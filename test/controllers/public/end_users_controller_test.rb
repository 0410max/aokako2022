require 'test_helper'

class Public::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get board" do
    get public_end_users_board_url
    assert_response :success
  end

  test "should get edit" do
    get public_end_users_edit_url
    assert_response :success
  end

  test "should get followers" do
    get public_end_users_followers_url
    assert_response :success
  end

  test "should get followings" do
    get public_end_users_followings_url
    assert_response :success
  end

  test "should get index" do
    get public_end_users_index_url
    assert_response :success
  end

  test "should get search" do
    get public_end_users_search_url
    assert_response :success
  end

  test "should get show" do
    get public_end_users_show_url
    assert_response :success
  end

end
