require 'test_helper'

class PublisherTest < ActiveSupport::TestCase
  def setup
    @publisher = Publisher.new(name: "Test publisher")
  end

  test "should be valid" do
    assert @publisher.valid?
  end

  test "name should be present" do
    @publisher.name = "     "
    assert_not @publisher.valid?
  end
end
