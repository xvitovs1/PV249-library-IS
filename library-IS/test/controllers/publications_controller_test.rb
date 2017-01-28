require 'test_helper'

class PublicationsControllerTest < ActionDispatch::IntegrationTest
	def setup
    @publication = publications(:one)
    @publication.save
  end

  test "should not get new when not authorized" do
    get  '/books/:id/publications/new', params: {id: 1}
    assert_redirected_to '/librarians/denied'
  end

  test "should not get edit when not authorized" do
    get '/publications/:id/edit', params: {id: @publication.id}
    assert_redirected_to '/librarians/denied'
  end

   test "should not delete when not authorized" do
    delete "/publications/:id", params: {id: @publication.id}
    assert_redirected_to '/librarians/denied'
  end
end
