require 'test_helper'

class EstradasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estrada = estradas(:one)
  end

  test "should get index" do
    get estradas_url
    assert_response :success
  end

  test "should get new" do
    get new_estrada_url
    assert_response :success
  end

  test "should create estrada" do
    assert_difference('Estrada.count') do
      post estradas_url, params: { estrada: { geom: @estrada.geom } }
    end

    assert_redirected_to estrada_url(Estrada.last)
  end

  test "should show estrada" do
    get estrada_url(@estrada)
    assert_response :success
  end

  test "should get edit" do
    get edit_estrada_url(@estrada)
    assert_response :success
  end

  test "should update estrada" do
    patch estrada_url(@estrada), params: { estrada: { geom: @estrada.geom } }
    assert_redirected_to estrada_url(@estrada)
  end

  test "should destroy estrada" do
    assert_difference('Estrada.count', -1) do
      delete estrada_url(@estrada)
    end

    assert_redirected_to estradas_url
  end
end
