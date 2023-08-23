require "test_helper"

class TimeEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get time_entries_index_url
    assert_response :success
  end

  test "should get show" do
    get time_entries_show_url
    assert_response :success
  end

  test "should get new" do
    get time_entries_new_url
    assert_response :success
  end

  test "should get create" do
    get time_entries_create_url
    assert_response :success
  end

  test "should get edit" do
    get time_entries_edit_url
    assert_response :success
  end

  test "should get update" do
    get time_entries_update_url
    assert_response :success
  end

  test "should get destroy" do
    get time_entries_destroy_url
    assert_response :success
  end
end
