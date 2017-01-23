require 'test_helper'

class PublicationTest < ActiveSupport::TestCase
  def setup
    @author = Author.new(name: "test author")
    @book = Book.new(title: "test title", author: @author)
    @publication = Publication.new(ISBN: "123abc", year: "1992")
    @book.publications << @publication
    @publisher = Publisher.new(name: "test publisher")
    @publisher.publications << @publication
  end

  test "should be valid" do
    assert @publication.valid?
  end

  test "ISBN should be present" do
    @publication.ISBN = "     "
    assert_not @publication.valid?
  end
end
