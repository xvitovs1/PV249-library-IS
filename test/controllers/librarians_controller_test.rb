require 'test_helper'

class LibrariansControllerTest < ActionDispatch::IntegrationTest
  def setup
    @librarian = librarians(:one)
    @librarian.save
  end

  test 'should not get new when not authorized' do
    get '/librarians/new', params: { id: 1 }
    assert_redirected_to '/librarians/denied'
  end

  test 'should not show when not authorized' do
    get '/librarians/:id', params: { id: @librarian.id }
    assert_redirected_to '/librarians/denied'
  end
end
