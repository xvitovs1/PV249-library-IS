require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @book = books(:one)
    @book.save
  end

  test "should not get new when not authorized" do
    get books_new_url
    assert_redirected_to '/librarians/denied'
  end

  test "should not get edit when not authorized" do
    get '/books/:id/edit', params: {id: @book.id}
    assert_redirected_to '/librarians/denied'
  end

  test "should get show" do
    get "/books/" + @book.id.to_s
    assert_response :success
  end

  test "should get index" do
    get "/books/"
    assert_response :success
  end

  test "should not delete when not authorized" do
    delete "/books/:id", params: {id: @book.id}
    assert_redirected_to '/librarians/denied'
  end
end
