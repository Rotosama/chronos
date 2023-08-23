require "test_helper"

class BreaksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get breaks_index_url
    assert_response :success
  end

  test "should get show" do
    get breaks_show_url
    assert_response :success
  end

  test "should get new" do
    get breaks_new_url
    assert_response :success
  end

  test "should get create" do
    get breaks_create_url
    assert_response :success
  end

  test "should get edit" do
    get breaks_edit_url
    assert_response :success
  end

  test "should get update" do
    get breaks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get breaks_destroy_url
    assert_response :success
  end
end
