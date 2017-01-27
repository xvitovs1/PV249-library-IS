require 'test_helper'

class ReaderTest < ActiveSupport::TestCase
	def setup
    @user = User.new(name: "Test user", email: "test@example.com", password: "pass", password_confirmation: "pass")
    @reader = Reader.new(card_code: "123abc")
    @user.reader = @reader
  end

  test "should be valid" do
    assert @reader.valid?
  end

  test "card_code should be present" do
    @reader.card_code = "     "
    assert_not @reader.valid?
  end
end
