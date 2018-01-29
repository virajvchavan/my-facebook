require 'test_helper'

class AddressControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get address_create_url
    assert_response :success
  end

  test "should get update" do
    get address_update_url
    assert_response :success
  end

end
