require 'test_helper'

class EdificacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edificacao = edificacaos(:one)
  end

  test "should get index" do
    get edificacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_edificacao_url
    assert_response :success
  end

  test "should create edificacao" do
    assert_difference('Edificacao.count') do
      post edificacaos_url, params: { edificacao: { geom: @edificacao.geom } }
    end

    assert_redirected_to edificacao_url(Edificacao.last)
  end

  test "should show edificacao" do
    get edificacao_url(@edificacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_edificacao_url(@edificacao)
    assert_response :success
  end

  test "should update edificacao" do
    patch edificacao_url(@edificacao), params: { edificacao: { geom: @edificacao.geom } }
    assert_redirected_to edificacao_url(@edificacao)
  end

  test "should destroy edificacao" do
    assert_difference('Edificacao.count', -1) do
      delete edificacao_url(@edificacao)
    end

    assert_redirected_to edificacaos_url
  end
end
