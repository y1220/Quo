require 'test_helper'

class WallsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get walls_new_url
    assert_response :success
  end

end
