require 'test_helper'

class FerroviaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ferrovium = ferrovia(:one)
  end

  test "should get index" do
    get ferrovia_url
    assert_response :success
  end

  test "should get new" do
    get new_ferrovium_url
    assert_response :success
  end

  test "should create ferrovium" do
    assert_difference('Ferrovium.count') do
      post ferrovia_url, params: { ferrovium: { geom: @ferrovium.geom } }
    end

    assert_redirected_to ferrovium_url(Ferrovium.last)
  end

  test "should show ferrovium" do
    get ferrovium_url(@ferrovium)
    assert_response :success
  end

  test "should get edit" do
    get edit_ferrovium_url(@ferrovium)
    assert_response :success
  end

  test "should update ferrovium" do
    patch ferrovium_url(@ferrovium), params: { ferrovium: { geom: @ferrovium.geom } }
    assert_redirected_to ferrovium_url(@ferrovium)
  end

  test "should destroy ferrovium" do
    assert_difference('Ferrovium.count', -1) do
      delete ferrovium_url(@ferrovium)
    end

    assert_redirected_to ferrovia_url
  end
end
