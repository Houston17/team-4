require 'test_helper'

class VolunteerControllerTest < ActionDispatch::IntegrationTest
  test "should get bob" do
    get volunteer_bob_url
    assert_response :success
  end

  test "should get emma" do
    get volunteer_emma_url
    assert_response :success
  end

  test "should get mike" do
    get volunteer_mike_url
    assert_response :success
  end

end
