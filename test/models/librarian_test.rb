require 'test_helper'

class LibrarianTest < ActiveSupport::TestCase
	def setup
    @user = User.new(name: "Test user", email: "test@example.com", password: "pass", password_confirmation: "pass")
    @librarian = Librarian.new(card_code: "123abc")
    @user.librarian = @librarian
  end

  test "should be valid" do
    assert @librarian.valid?
  end

  test "card_code should be present" do
    @librarian.card_code = "     "
    assert_not @librarian.valid?
  end
end
