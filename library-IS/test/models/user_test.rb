require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Test user", email: "test@example.com", password: "pass", password_confirmation: "pass")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 100
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 500 + "@example.com"
    assert_not @user.valid?
  end

	test "validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@example.COM u-s-e-r@ex.am.ple
                         u.S.e-r@example.cz]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

	test "validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com useratexample.org user.test@example.
                           user@example_example.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

	test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

	test "email addresses should be saved lower-case" do
    mixed_case_email = "UseR@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

   test "password should not be blank" do
    @user.password = @user.password_confirmation = ""
    assert_not @user.valid?
  end
end
