require 'test_helper'

class PontesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ponte = pontes(:one)
  end

  test "should get index" do
    get pontes_url
    assert_response :success
  end

  test "should get new" do
    get new_ponte_url
    assert_response :success
  end

  test "should create ponte" do
    assert_difference('Ponte.count') do
      post pontes_url, params: { ponte: { geom: @ponte.geom } }
    end

    assert_redirected_to ponte_url(Ponte.last)
  end

  test "should show ponte" do
    get ponte_url(@ponte)
    assert_response :success
  end

  test "should get edit" do
    get edit_ponte_url(@ponte)
    assert_response :success
  end

  test "should update ponte" do
    patch ponte_url(@ponte), params: { ponte: { geom: @ponte.geom } }
    assert_redirected_to ponte_url(@ponte)
  end

  test "should destroy ponte" do
    assert_difference('Ponte.count', -1) do
      delete ponte_url(@ponte)
    end

    assert_redirected_to pontes_url
  end
end
