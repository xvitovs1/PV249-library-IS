require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get authors_new_url
    assert_response :success
  end

end
