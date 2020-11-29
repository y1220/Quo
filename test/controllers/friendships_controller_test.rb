require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get friendships_new_url
    assert_response :success
  end

end
