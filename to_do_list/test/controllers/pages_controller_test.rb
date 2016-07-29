require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

  test "should get help" do
    get pages_help_url
=======
  test "should get contact" do
    get contact_url
    assert_response :success
  end

  test "should get help" do
    get help_url
    assert_response :success
  end

  test "should get home" do
    get root_url
>>>>>>> pages
    assert_response :success
  end

end
