require 'test_helper'

class LagosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lago = lagos(:one)
  end

  test "should get index" do
    get lagos_url
    assert_response :success
  end

  test "should get new" do
    get new_lago_url
    assert_response :success
  end

  test "should create lago" do
    assert_difference('Lago.count') do
      post lagos_url, params: { lago: { geom: @lago.geom } }
    end

    assert_redirected_to lago_url(Lago.last)
  end

  test "should show lago" do
    get lago_url(@lago)
    assert_response :success
  end

  test "should get edit" do
    get edit_lago_url(@lago)
    assert_response :success
  end

  test "should update lago" do
    patch lago_url(@lago), params: { lago: { geom: @lago.geom } }
    assert_redirected_to lago_url(@lago)
  end

  test "should destroy lago" do
    assert_difference('Lago.count', -1) do
      delete lago_url(@lago)
    end

    assert_redirected_to lagos_url
  end
end
