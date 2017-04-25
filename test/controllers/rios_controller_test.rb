require 'test_helper'

class RiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rio = rios(:one)
  end

  test "should get index" do
    get rios_url
    assert_response :success
  end

  test "should get new" do
    get new_rio_url
    assert_response :success
  end

  test "should create rio" do
    assert_difference('Rio.count') do
      post rios_url, params: { rio: { descricao: @rio.descricao, geom: @rio.geom } }
    end

    assert_redirected_to rio_url(Rio.last)
  end

  test "should show rio" do
    get rio_url(@rio)
    assert_response :success
  end

  test "should get edit" do
    get edit_rio_url(@rio)
    assert_response :success
  end

  test "should update rio" do
    patch rio_url(@rio), params: { rio: { descricao: @rio.descricao, geom: @rio.geom } }
    assert_redirected_to rio_url(@rio)
  end

  test "should destroy rio" do
    assert_difference('Rio.count', -1) do
      delete rio_url(@rio)
    end

    assert_redirected_to rios_url
  end
end
