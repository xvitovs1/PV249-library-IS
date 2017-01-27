require 'test_helper'

class BorrowTest < ActiveSupport::TestCase
  def setup
    publication = publications(:one)
    publication.save
    @borrow = Borrow.new(borrow_date: Date.today, expected_return_date: Date.tomorrow, publication: publications(:one), reader: readers(:one))
  end

  test "should be valid" do
    assert @borrow.valid?
  end

  test "publication should be present" do
    @borrow.publication = nil
    assert_not @borrow.valid?
  end

  test "reader should be present" do
    @borrow.reader = nil
    assert_not @borrow.valid?
  end

  test "should be active" do
    assert @borrow.active?
  end

  test "should not be active" do
    @borrow.return_date = Date.today
    assert_not @borrow.active?
  end
end
