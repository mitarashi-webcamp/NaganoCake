require "test_helper"

class DeliveryAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get delivery_addresses_index_url
    assert_response :success
  end

  test "should get edit" do
    get delivery_addresses_edit_url
    assert_response :success
  end
end
