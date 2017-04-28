require 'test_helper'

class RodoviaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rodovium = rodovia(:one)
  end

  test "should get index" do
    get rodovia_url
    assert_response :success
  end

  test "should get new" do
    get new_rodovium_url
    assert_response :success
  end

  test "should create rodovium" do
    assert_difference('Rodovium.count') do
      post rodovia_url, params: { rodovium: { geom: @rodovium.geom } }
    end

    assert_redirected_to rodovium_url(Rodovium.last)
  end

  test "should show rodovium" do
    get rodovium_url(@rodovium)
    assert_response :success
  end

  test "should get edit" do
    get edit_rodovium_url(@rodovium)
    assert_response :success
  end

  test "should update rodovium" do
    patch rodovium_url(@rodovium), params: { rodovium: { geom: @rodovium.geom } }
    assert_redirected_to rodovium_url(@rodovium)
  end

  test "should destroy rodovium" do
    assert_difference('Rodovium.count', -1) do
      delete rodovium_url(@rodovium)
    end

    assert_redirected_to rodovia_url
  end
end
