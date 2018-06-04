require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get additional_info_update" do
    get registrations_additional_info_update_url
    assert_response :success
  end

end
