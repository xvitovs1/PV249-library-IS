require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @author = authors(:one)
    @author.save
  end

  test "should not get new when not authorized" do
    get authors_new_url
    assert_redirected_to '/librarians/denied'
  end

  test "should not get edit when not authorized" do
    get '/authors/:id/edit', params: {id: @author.id}
    assert_redirected_to '/librarians/denied'
  end

  test "should get show" do
    get "/authors/", params: {id: @author.id}
    assert_response :success
  end

  test "should not delete when not authorized" do
    delete "/authors/:id", params: {id: @author.id}
    assert_redirected_to '/librarians/denied'
  end
end
