require 'test_helper'

class StaticContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get static_contents_top_url
    assert_response :success
  end

  test "should get about" do
    get static_contents_about_url
    assert_response :success
  end

  test "should get access" do
    get static_contents_access_url
    assert_response :success
  end

  test "should get contact" do
    get static_contents_contact_url
    assert_response :success
  end

end
