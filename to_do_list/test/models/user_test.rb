require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Getty", email:"getty@gmail.com", password: "grace", password_confirmation: "grace")
  end

  test "user should be valid" do
    assert @user.valid?
 end

  test "name should be present" do
  @user.name = " "
  assert_not @user.valid?
end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "gee"*30
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "gee"*50
    assert_not @user.valid?
  end

  test "email should accept valid adresses" do
    valid_emails = %w[getty@gmaiil.com gett_y@gmail.com o.rawo@vmail.com]
    valid_emails.each do |valid_mail|
      @user.email = valid_mail
      assert @user.valid?
  end
  end
  
  test "email should reject invalid adresses" do
    invalid_emails = %w[gettygmaiil.com @gmail.com o.rawo@com]
    invalid_emails.each do |invalid_mail|
      @user.email = invalid_mail
      assert_not @user.valid?
  end
  end

  test "email should be unique" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  test "password should have a minimum" do
    @user.password = @user.password_confirmation = "a"
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember,'')
  end
end
