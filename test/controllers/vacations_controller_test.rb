require "test_helper"

class VacationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vacations_index_url
    assert_response :success
  end

  test "should get edit" do
    get vacations_edit_url
    assert_response :success
  end

  test "should get update" do
    get vacations_update_url
    assert_response :success
  end

  test "should get new" do
    get vacations_new_url
    assert_response :success
  end

  test "should get create" do
    get vacations_create_url
    assert_response :success
  end

  test "should get delete" do
    get vacations_delete_url
    assert_response :success
  end
end
