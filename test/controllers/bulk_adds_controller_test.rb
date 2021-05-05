require "test_helper"

class BulkAddsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bulk_add = bulk_adds(:one)
  end

  test "should get index" do
    get bulk_adds_url
    assert_response :success
  end

  test "should get new" do
    get new_bulk_add_url
    assert_response :success
  end

  test "should create bulk_add" do
    assert_difference('BulkAdd.count') do
      post bulk_adds_url, params: { bulk_add: {  } }
    end

    assert_redirected_to bulk_add_url(BulkAdd.last)
  end

  test "should show bulk_add" do
    get bulk_add_url(@bulk_add)
    assert_response :success
  end

  test "should get edit" do
    get edit_bulk_add_url(@bulk_add)
    assert_response :success
  end

  test "should update bulk_add" do
    patch bulk_add_url(@bulk_add), params: { bulk_add: {  } }
    assert_redirected_to bulk_add_url(@bulk_add)
  end

  test "should destroy bulk_add" do
    assert_difference('BulkAdd.count', -1) do
      delete bulk_add_url(@bulk_add)
    end

    assert_redirected_to bulk_adds_url
  end
end
