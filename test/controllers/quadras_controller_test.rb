require 'test_helper'

class QuadrasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quadra = quadras(:one)
  end

  test "should get index" do
    get quadras_url
    assert_response :success
  end

  test "should get new" do
    get new_quadra_url
    assert_response :success
  end

  test "should create quadra" do
    assert_difference('Quadra.count') do
      post quadras_url, params: { quadra: { descricao: @quadra.descricao, localizacao: @quadra.localizacao } }
    end

    assert_redirected_to quadra_url(Quadra.last)
  end

  test "should show quadra" do
    get quadra_url(@quadra)
    assert_response :success
  end

  test "should get edit" do
    get edit_quadra_url(@quadra)
    assert_response :success
  end

  test "should update quadra" do
    patch quadra_url(@quadra), params: { quadra: { descricao: @quadra.descricao, localizacao: @quadra.localizacao } }
    assert_redirected_to quadra_url(@quadra)
  end

  test "should destroy quadra" do
    assert_difference('Quadra.count', -1) do
      delete quadra_url(@quadra)
    end

    assert_redirected_to quadras_url
  end
end
