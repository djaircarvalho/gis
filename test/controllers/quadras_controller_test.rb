require 'test_helper'

class QuadrasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get quadras_new_url
    assert_response :success
  end

  test "should get create" do
    get quadras_create_url
    assert_response :success
  end

end
