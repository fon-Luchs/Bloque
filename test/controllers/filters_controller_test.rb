require 'test_helper'

class FiltersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get filters_create_url
    assert_response :success
  end

end
