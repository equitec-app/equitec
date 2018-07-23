require 'test_helper'

class SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get customers" do
    get searchs_customers_url
    assert_response :success
  end

  test "should get power_plants" do
    get searchs_power_plants_url
    assert_response :success
  end

  test "should get ups" do
    get searchs_ups_url
    assert_response :success
  end

end
