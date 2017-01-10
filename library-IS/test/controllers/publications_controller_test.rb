require 'test_helper'

class PublicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get publications_new_url
    assert_response :success
  end

end
