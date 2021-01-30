require 'test_helper'

class MonstersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get monsters_index_url
    assert_response :success
  end

  test "should get show" do
    get monsters_show_url
    assert_response :success
  end

  test "should get new" do
    get monsters_new_url
    assert_response :success
  end

  test "should get create" do
    get monsters_create_url
    assert_response :success
  end

  test "should get edit" do
    get monsters_edit_url
    assert_response :success
  end

  test "should get update" do
    get monsters_update_url
    assert_response :success
  end

  test "should get destroy" do
    get monsters_destroy_url
    assert_response :success
  end

end
