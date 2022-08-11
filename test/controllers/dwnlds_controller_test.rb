require "test_helper"

class DwnldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dwnld = dwnlds(:one)
  end

  test "should get index" do
    get dwnlds_url
    assert_response :success
  end

  test "should get new" do
    get new_dwnld_url
    assert_response :success
  end

  test "should create dwnld" do
    assert_difference('Dwnld.count') do
      post dwnlds_url, params: { dwnld: {  } }
    end

    assert_redirected_to dwnld_url(Dwnld.last)
  end

  test "should show dwnld" do
    get dwnld_url(@dwnld)
    assert_response :success
  end

  test "should get edit" do
    get edit_dwnld_url(@dwnld)
    assert_response :success
  end

  test "should update dwnld" do
    patch dwnld_url(@dwnld), params: { dwnld: {  } }
    assert_redirected_to dwnld_url(@dwnld)
  end

  test "should destroy dwnld" do
    assert_difference('Dwnld.count', -1) do
      delete dwnld_url(@dwnld)
    end

    assert_redirected_to dwnlds_url
  end
end
