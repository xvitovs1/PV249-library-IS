require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @author = Author.new(name: "test author")
    @book = Book.new(title: "Test book", description: "some description")
    @book.author = @author
  end

  test "should be valid" do
    assert @book.valid?
  end

  test "title should be present" do
    @book.title = "     "
    assert_not @book.valid?
  end

  test "author should be present" do
    @book.author = nil
    assert_not @book.valid?
  end
end
